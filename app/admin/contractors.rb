ActiveAdmin.register Contractor do
    permit_params do
      permitted = [:email, :password, :first_name, :last_name, :phone_number]
      permitted
    end
    
end
  