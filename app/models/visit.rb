class Visit < ApplicationRecord
    belongs_to :work_order
    belongs_to :admin_user
    validates :title, :work_order_id, :admin_user_id, :due_date, :presence => true
    validates :is_done, :inclusion => { :in => [true, false] }
end
