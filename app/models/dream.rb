class Dream < ApplicationRecord
  belongs_to :user

  validates :dream_title, :dream_text, presence: true
  validates :dream_title, length: { in: 2..50 }
  validates :dream_text, length: { maximum: 500,
    too_long: "Слишком длинный текст, допустимо %{count} символов" }
end
