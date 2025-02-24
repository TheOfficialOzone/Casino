require "test_helper"

class HorseRacesControllerTest < ActionDispatch::IntegrationTest
  def login
    post session_path, params: { session: { username: "one1", password: "password" } }
    assert_response :redirect
  end

  test "should get race betting path" do
    login
    get horse_race_betting_path
    assert_response :success
  end

  # Horse Race Betting
  def place_bet(params)
    post submit_bet_path, params: params
    assert_response :redirect
  end

  def does_wager_pay(kind)
    user = User.first
    user_id = user.id
    balance = user.balance
    winner = Horse.order(:speed).first
    place_bet({ horse: winner.id, kind: kind, amount: 1.00 })
    post resolve_race_path

    assert balance * winner.odds(kind) == User.find(user_id).balance
  end

  test "should place show bet" do
    login
    place_bet({ horse: Horse.first.id, kind: :show, amount: 0.0 })
  end

  test "should place place bet" do
    login
    place_bet({ horse: Horse.first.id, kind: :place, amount: 0.0 })
  end

  test "should place straight bet" do
    login
    place_bet({ horse: Horse.first.id, kind: :straight, amount: 0.0 })
  end

  test "should place multiple bets on same horse" do
    login
    place_bet({ horse: Horse.first.id, kind: :show, amount: 0.0 })
    place_bet({ horse: Horse.first.id, kind: :place, amount: 0.0 })
    place_bet({ horse: Horse.first.id, kind: :straight, amount: 0.0 })

    assert Wager.count == 3
  end

  test "should place multiple bets on different horses" do
    place_bet({ horse: Horse.first.id, kind: :show, amount: 0.0 })
    place_bet({ horse: Horse.second.id, kind: :place, amount: 0.0 })

    assert Wager.count == 2
  end

  test "should pay user accordingly for sucessful show wager" do
    login
    does_wager_pay :show
  end

  test "should pay user accordingly for sucessful place wager" do
    login
    does_wager_pay :place
  end

  test "should pay user accordingly for sucessful straight wager" do
    login
    does_wager_pay :straight
  end

  test "should lose user money for a bad bet" do
    login
    user = User.first
    kind = :straight
    amount = 1.00

    User.update(balance: amount)

    loser = Horse.order(speed: :desc).first

    place_bet({ horse: loser.id, kind: kind, amount: amount })
    post resolve_race_path

    user.reload

    assert user.balance
  end
end
