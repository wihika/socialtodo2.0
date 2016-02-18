class Task < ActiveRecord::Base
    belongs_to :user
    validates :title, length: { maximum: 500}, presence: true
    validates :description, length: {maximum: 5000}, presence: true
end
