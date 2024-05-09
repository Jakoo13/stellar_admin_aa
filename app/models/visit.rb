class Visit < ApplicationRecord
    belongs_to :work_order
    belongs_to :admin_user
    validates :title, :work_order_id, :admin_user_id, :appointment_date, :stage, :presence => true
end
