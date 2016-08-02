class Client < ApplicationRecord
  has_many :term
  has_many :room, through: :term

  default_scope -> { order(:last_name) }

  before_validation :parse_in_phone_number
  validates :first_name, presence: true, 
                         length: {maximum: 50},
                         format: { with: /[\p{L}\p{Pd}.]/ }
  validates :last_name, presence: true, 
                        length: {maximum: 50},
                        format: { with: /[\p{L}\p{Pd}.]/ }
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
                    unless: Proc.new { |a| a.email.blank? }
  validates :phone_number, presence: true,
                           length: { minimum: 7, maximum: 20 },
                           numericality: { only_integer: true },
                           uniqueness: { case_sensitive: false }
  
  def parse_out_phone_number
    letter = 0 
    result = ""; 
    self.phone_number.split("").each do |x| 
      letter += 1 
      if letter == 4
        letter = 1 
        result += "-"
      end
      result += x;
    end
    return result
  end

  def a
    "#{self.first_name} #{self.last_name} #{self.phone_number}"
  end

  protected
    def parse_in_phone_number
      self.phone_number.gsub!(/[()-.+x ]/, '')    
    end

end
