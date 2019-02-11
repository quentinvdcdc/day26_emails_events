class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
end
