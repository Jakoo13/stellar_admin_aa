ActiveAdmin.register WorkOrder do

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
    permitted = [:title, :description]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  show :title => :title do
    panel "Visits" do
      table_for work_order.visits do |t|
        t.column("Status") { |visit| status_tag((visit.is_done ? "Done" : "Pending"), class: (visit.is_done ? :ok : :error)) }
        t.column("Title") { |visit| link_to visit.title, admin_work_order_path(visit) }
        t.column("Assigned To") { |visit| visit.admin_user.email }
        t.column("Due Date") { |visit| visit.due_date? ? l(visit.due_date, :format => :long) : '-' }
      end
    end
  end
  
end
