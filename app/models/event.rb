class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :event_attendee, dependent: :destroy

  validates :name, :location, :date, presence: true
  validates :name, :location, length: { in: 5..64 }

  scope :today, -> { where(date: :today?) }
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }

end
