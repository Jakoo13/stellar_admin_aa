class WorkOrder < ApplicationRecord
    has_many :visits
    validates :title, :description, presence: true
end
