class Event < ApplicationRecord
	belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances
  validate :start_date_cannot_be_created_in_the_past, on: :create
  validate :start_date_cannot_be_updated_when_past, on: :update
  validate :duration_should_modulo_five, :duration_should_not_be_null
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, inclusion: 1..1000
  validates :location, presence: true

  def duration_should_modulo_five
  	errors.add(:duration, "should be modulo five") if
  		!(duration % 5 == 0)
  end

  def duration_should_not_be_null
  	errors.add(:duration, "should not be null or absent") if
  		duration == 0 || !duration.present?
  end

  def start_date_cannot_be_created_in_the_past
  	errors.add(:start_date, "can't be created with past date or absent") if
  		!start_date.present? || start_date < Time.now
  end

  def start_date_cannot_be_updated_when_past
  	errors.add(:start_date, "can't be updated in the past") if
  		start_date < Date.today
	end

  def end_date
    self.start_date + (self.duration).minute
  end
end
