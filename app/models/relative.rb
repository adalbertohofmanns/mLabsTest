class Relative < ApplicationRecord
  belongs_to :user
  validates :name, :kinship, :user, presence: true
end
