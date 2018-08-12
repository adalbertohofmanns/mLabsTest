class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :async, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relatives, dependent: :destroy
end
