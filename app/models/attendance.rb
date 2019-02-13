class Attendance < ApplicationRecord
	after_create :subscription_send

  belongs_to :attendee, class_name: "User"
  belongs_to :event
  validates :stripe_customer_id, presence: true

  def subscription_send
  	@event = Attendance.last.event
  	@attendee = Attendance.last.attendee
  	UserMailer.event_subscription_email(@event, @attendee).deliver_now
	end
end
