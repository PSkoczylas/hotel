class Term < ApplicationRecord
  belongs_to :room
  belongs_to :client
  
  validate :correct_term?
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :room_id, presence: true
  validates :client_id, presence: true
  validates :quantity_of_beds, presence: true,
                               numericality: { greater_than: 0 }

  def correct_term?
    errors.add(:correct_term, "end date must be more than begin date") if self.begin_date >= self.end_date
  end
end
