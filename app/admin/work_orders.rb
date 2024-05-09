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
    permitted = [:title, :description]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end

  show :title => :title do
    panel "Visits" do
      table_for work_order.visits do |t|
        t.column("ID") { |visit| link_to visit.id, admin_visit_path(visit) }
        t.column("Stage") { |visit| visit.stage }
        t.column("Title") { |visit| visit.title }
        t.column("Stage") { |visit| visit.stage }
        t.column("Assigned To") { |visit| visit.admin_user.email }
        t.column("Due Date") { |visit| visit.appointment_date? ? l(visit.appointment_date, :format => :long) : '-' }
      end
    end
  end
  
end
