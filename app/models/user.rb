class User < ApplicationRecord
  has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances
  has_many :attended_events, foreign_key: 'attended_id', class_name: "Event", through: :attendances
end
