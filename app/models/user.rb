class User < ApplicationRecord
  VALID_EMAL_REGEX = /.+@.+\..+/i

  has_many :dreams, dependent: :destroy
  
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: VALID_EMAL_REGEX }
  
  has_secure_password
end
