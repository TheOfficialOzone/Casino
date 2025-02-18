class Wager < ApplicationRecord
  belongs_to :user
  belongs_to :horse

  validates :amount, presence: true, numericality: true
  validates :kind, presence: true, inclusion: {in: %w(straight place), message: "%{value} is not a valid kind type" }
end
