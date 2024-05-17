class Visit < ApplicationRecord
    belongs_to :work_order
    belongs_to :contractor
    validates :title, :work_order_id, :contractor_id, :appointment_date, :stage, :presence => true
end
