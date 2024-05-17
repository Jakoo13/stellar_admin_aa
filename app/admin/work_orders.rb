ActiveAdmin.register WorkOrder do
  # This removes the "New Work Order" button from the index page
  # actions :all, :except => [:new]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description
  #
  # or
  #
  permit_params do
    permitted = [:title, :description, :address]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  show :title => :title do
    panel "Work Order Details" do
      attributes_table_for work_order do
        row :title
        row :description
        row :address
      end
    end

    panel "Visits" do
      div do
        link_to 'Create Visit', new_admin_visit_path(work_order_id: work_order.id), class: 'button'
      end
      table_for work_order.visits do |t|
        t.column("ID") { |visit| link_to visit.id, admin_visit_path(visit) }
        t.column("Stage") { |visit| visit.stage }
        t.column("Title") { |visit| visit.title }
        t.column("Stage") { |visit| visit.stage }
        t.column("Assigned To") { |visit| visit.contractor.email }
        t.column("Due Date") { |visit| visit.appointment_date? ? l(visit.appointment_date, :format => :long) : '-' }
      end
    end
  end
  
end
