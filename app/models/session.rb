# This model represents a session for a signed-in user
class Session < ApplicationRecord
  belongs_to :user
end
