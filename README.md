# COMP 4350 Proposal - Second Team

### Group members:

- Caelan Myskiw (Leader)
- Cole Chuchmach
- Michael Walld
- Niko Christie
- Owen Zonneveld

## Project summary and vision

Our project vision is to create an online “casino” website. This website will allow users to play casino games using an online currency (no real cash equivalent). The currency will be able to be used across all different games with users being able to use their username to save a profile that maintains a persistent currency amount.  Additionally, to create an increased sense of community and realism we will have a global chat feature which allows users to talk amongst themselves.

We want to create a platform where users can enjoy gambling our fake currency, feel a sense of community, and experience friendly competition.

The stakeholders of this project are players, the development team, and the evaluators (TA and Prof).

## Core features

1. Manage an account, be able to create an account using a simple Username and then login using that same account. This would store stats related to player and the games they’ve played.

2. Ability to switch between casino games via a lobby system.

3. A wallet system that allows users to bet any amount on games + persistence between games. Additionally, the user will be given an “allowance” wherein each day the user will be given 1000 of our fake currency to play with.

4. Chat system with global chat when in the main lobby, and individual chats when in the specific games (horse racing, roulette, blackjack)

5. Horse racing will select a fixed number of horses with chances of winning adding up to 1, the horses with lower % will offer higher payout.

6. Roulette will have a grace period for users to bet on specific numbers or colours and then will spin after the period ends

7. Blackjack will be playing with a deck against 3-4 players concurrently. Each player will have a certain amount of time (15s) to decide before going on to each player. After all players have gone the AI will flip their card and draw until 17 or bust.

8. Leaderboard which will display the top users account balance and other related stats.

9. Can handle 100 users with 1000 requests per minute concurrently.

## Technologies

- Ruby on rails
- MySQL
- Docker
- Github Actions

## User stories

As a new user, I want to be able to create an account in the casino, so that I can save my winnings and gaming stats when I no longer have time to play. (persistent data - create account)

As a returning user, I want to be able to login with a username, so that I can continue gambling using my saved gaming stats and earned winnings. (persistent data - login)

As a user, I want to be able to switch between multiple games on the website, so that I can explore different gaming options without being stuck only playing the game I initially picked. (casino hub)

As a user, I want to be able to chat with other users before picking a game, so that I can socialize with other players and ask them what games they would recommend. (chat feature - casino hub/lobby/concurrent chatting)

As a user, I want to be able to chat with other users at the same table as me, so that I can have an authentic gambling experience as if we were all really playing the same game. (chat feature - individual games/concurrent chatting)

As a user, I want to be able to place outside bets in roulette, so that I can still win some money with an overall lower risk of losing. (games - roulette/outside bets)

As a user, I want to be able to place inside bets in roulette, so that I can risk losing more with the potential of a higher payout. (games - roulette/inside bets)

As a user, I want to view the horses about to race in horse racing, so that I can compare and contrast the win rate and potential payoff of each in real time. (games - horse racing/viewing horses)

As a user, I want to be able to bet on a single horse in horse racing, so that I can focus on just one horse and maximize my potential winnings if that horse wins. (games - horse racing/single horse bet)

As a user, I want to be able to bet on multiple horses in horse racing, so that I can increase my chances of winning by diversifying my bets. (games - horse racing/multiple horse bet)

As a user, I want to be able to make a multi-bet in horse racing, so that I can combine multiple horse predictions into a single wager and potentially win larger payouts. (games - horse racing/multi-bet)

As a user, I want to be able to hit or stand with my current hand in blackjack, so that I have the opportunity to strategize about my hand before the dealer gets to draw. (games - blackjack/basics)

As a user, I want to be able to double down with my current hand in blackjack, so that I am able to risk busting or having a lower count for a larger payout. (games - blackjack/double down)

As a user, I want to be able to split my current hand in blackjack, so that I am able to risk running two hands with the potential of winning a larger payout. (games - blackjack/splitting)

As a user, I want to be able to play with other users at the same time, so that I can determine the best move based on the actions of the other players. (games - blackjack/concurrency)


As a user, I want to be able to play a blackjack game at the same time as others, so that I feel as though I am actually at a real table with players and a dealer. (games - blackjack/concurrency)


As a user, I want to be able to see the other top players in the casino, so that I can try to beat other players currency count and win rates (leaderboard)

As a user, I want to be able to use the currency to be global, so that I can win one game, and use that won concurrency to bet in another game. (wallet - persistent currency)
 

## Block Diagram:
![A block diagram representing our architecture](BlockDiagram.png "Block Diagram")
