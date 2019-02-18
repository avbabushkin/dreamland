class User < ApplicationRecord
  has_many :dreams, dependent: :destroy 
  
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :name, :username, length: { in: 6..40,
    too_short: "введите минимум %{count} символов",
    too_long: "введите не более %{coutn} символов" }
  validates :username, format: { with: /\A[a-z\d_]*\z/ }
  

  validates :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: { minimum: 6, 
    too_short: "слишком короткий пароль, минимум %{count} символов" }

end
