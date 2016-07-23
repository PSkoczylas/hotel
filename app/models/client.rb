class Client < ApplicationRecord
  has_many :term
  has_many :room, through: :term

  before_validation :parse_phone_number
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone_number, presence: true,
                           length: { minimum: 7, maximum: 20 },
                           numericality: { only_integer: true },
                           uniqueness: { case_sensitive: false }

  protected
  def parse_phone_number
    self.phone_number.gsub!(/[()-.+x ]/, '')    
  end
end
