ActiveAdmin.register Visit do
  permit_params do
    permitted = [:work_order_id, :admin_user_id, :title, :appointment_date, :stage]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  form do |f|
    f.inputs do
      f.input :work_order
      f.input :admin_user
      f.input :title
      f.input :appointment_date
      f.input :stage, as: :select, collection: ['Scheduled', 'In Progress', 'Completed']
    end
    f.actions
  end
  
end
