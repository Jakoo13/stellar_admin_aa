class WorkOrder < ApplicationRecord
    has_many :visits
    validates :title, :description, :address, presence: true
end
