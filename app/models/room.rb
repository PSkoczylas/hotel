class Room < ApplicationRecord
  validates :room_number, presence: true,
                          uniqueness: {:scope => :floor},
                          numericality: { greater_than_or_equal_to: 0 }                       
  validates :floor, presence: true,
            numericality: { greater_than_or_equal_to: -1 }                       
            
  validates :quantity_of_beds, presence: true,
                               numericality: { greater_than_or_equal_to: 0 }                       
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  enum standard: { normal: 0, higher: 1, highest: 2 }

end
