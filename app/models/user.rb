class User < ApplicationRecord
  has_many :dreams, dependent: :destroy 
end
