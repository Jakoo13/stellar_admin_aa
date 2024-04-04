ActiveAdmin.register Visit do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :work_order_id, :admin_user_id, :title, :is_done
  #
  # or
  #
  permit_params do
    permitted = [:work_order_id, :admin_user_id, :title, :due_date, :is_done]
    permitted << :other if params[:action] == 'create' && current_admin_user.admin?
    permitted
  end
  
end
