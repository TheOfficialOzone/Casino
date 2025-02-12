class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address,
    presence: true,
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Enter a valid email address." },
    uniqueness: { case_sensitive: false, message: "Email address is already in use." }
  normalizes :username, with: ->(u) { u.strip }
  validates :username,
    presence: true,
    format: { with: /\A[a-zA-Z0-9_-]+\z/i, message: "Username must only contain letters, numbers, dashes, or underscores." },
    length: { in: 4..16, message: "Username must be between 4 and 16 characters long." },
    uniqueness: { case_sensitive: false, message: "Username already exists." }
  validates :password_digest,
    presence: true
  validates :balance,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }
end
