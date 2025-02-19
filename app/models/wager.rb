class Wager < ApplicationRecord
  belongs_to :user
  belongs_to :horse

  validates :amount, presence: true, numericality: true
  validates :kind, presence: true, inclusion: {in: %w(straight place show), message: "%{value} is not a valid kind type" }

  def payout
    odds = Horse.find(self.horse_id).odds(self.kind)
    return odds * self.amount
  end

  def self.tooltip(kind)
    case kind.to_sym
    when :straight
        return "if the horse comes in 1st place, the bet is a winner"
    when :place
        return "if the horse comes in 1st or 2nd place, the bet is a winner"
    when :show
        return "if the horse comes in 1st, 2nd or 3rd place, the bet is a winner"
    end
  end

  # Based on the horse's place did the wager hit?
  def hits?(place)
    case self.kind.to_sym
    when :straight
      return place <= 1 # Bet hits if horse get 1st place
    when :place
      return place <= 2 # Bet hits if horse get 1st or 2d place
    when :show
      return place <= 3 # Bet hits if horse gets 1st, 2nd or 3rd place
    else
      return false      # Otherwise the bet didn't hit
    end
  end

  # Pay the winner
  def fufill
    puts "Paying '#{User.find(self.user_id).username}' $#{'%.2f' % self.payout} for a #{self.kind.to_s.capitalize} bet of on '#{Horse.find(self.horse_id).name}'"
    user = User.find(self.user_id)
    user.balance += self.payout
    user.save
  end
end
