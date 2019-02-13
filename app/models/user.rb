class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	after_create :welcome_send

	has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances
  has_many :attended_events, foreign_key: 'attended_id', class_name: "Event", through: :attendances

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
	end
end
