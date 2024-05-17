ActiveAdmin.register Visit do
  permit_params do
    permitted = [:work_order_id, :contractor_id, :title, :appointment_date, :stage]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  form do |f|
    f.inputs do
      f.input :work_order_id, as: :hidden, input_html: { value: params[:work_order_id] }
      # show contractors first and last name in the dropdown
      f.input :contractor, as: :select, collection: Contractor.all.map{|c| ["#{c.first_name} #{c.last_name}", c.id]}
      f.input :title
      f.input :appointment_date
      f.input :stage, as: :select, collection: ['Scheduled', 'In Progress', 'Completed']
    end
    f.actions
  end
  
end
