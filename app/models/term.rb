class Term < ApplicationRecord
  belongs_to :room
  belongs_to :client

  default_scope -> { order(:begin_date) }
  
  validate :correct_term?, :free_term?, if: "begin_date.present? && end_date.present?"
  validate :room_exists?
  validate :client_exists?
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :room_id, presence: true
  validates :client_id, presence: true
  validates :quantity_of_beds, presence: true,
                               numericality: { greater_than: 0 }

  def get_price
    self.room.price * self.quantity_of_beds * (end_date - begin_date).to_i
  end

  def full_name
    "#{self.client.first_name} #{self.client.last_name}"
  end

  def correct_term?
    errors.add(:end_date, "end date must be more than begin date") if self.begin_date >= self.end_date
  end

  def room_exists?
    errors.add(:room_id, "room must exists") unless self.room.present?
  end

  def client_exists?
    errors.add(:client_id, "client must exists") unless self.client.present?
  end 

  def free_term?
    if self.id.present?
      ordered_places = Term.where('end_date > ? AND begin_date < ? AND room_id = ? AND id != ?', self.begin_date, self.end_date, self.room_id, self.id)
    else
      ordered_places = Term.where('end_date > ? AND begin_date < ? AND room_id = ?', self.begin_date, self.end_date, self.room_id)
    end
    beg_dates = ordered_places.pluck(:begin_date, :quantity_of_beds).to_a
    end_dates = ordered_places.pluck(:end_date, :quantity_of_beds).to_a
    could_reserved = self.room.quantity_of_beds - self.quantity_of_beds
    reserved = 0
    end_ind = 0

    beg_dates.each do |beg|
      while end_dates[end_ind][0] <= beg[0]
        cur -= e[end_ind][1]
        end_ind += 1
      end
      reserved += beg[1]
      errors.add(:quantity_of_beds, "term has to be free") if could_reserved < reserved
    end
  end
end
