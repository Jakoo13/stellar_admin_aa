ActiveAdmin.register Contractor do
    permit_params do
      permitted = [:email, :password, :password_confirmation, :admin]
      permitted
    end
    
end
  