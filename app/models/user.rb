# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAL_REGEX = /.+@.+\..+/i.freeze

  has_many :dreams, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAL_REGEX }
  validates :password, length: { in: 6..20 }

  has_secure_password
end
