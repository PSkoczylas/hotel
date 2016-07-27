class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, 
                         length: {maximum: 50},
                         format: { with: /[a-zA-Z]/ }
  validates :last_name, presence: true, 
                        length: {maximum: 50},
                         format: { with: /[a-zA-Z]/ }
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
end
