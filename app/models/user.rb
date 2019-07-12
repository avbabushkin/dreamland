class User < ApplicationRecord
  has_many :dreams, dependent: :destroy
  has_secure_password

  validates :email, presence: true, uniqueness: true

end
