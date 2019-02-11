class User < ApplicationRecord
	after_create :welcome_send

  has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances
  has_many :attended_events, foreign_key: 'attended_id', class_name: "Event", through: :attendances

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end
end
