# The Game

The Game is a mobile arcade like video-game where you have to touch a square when its color match the color of the background.
The square will keep its color until you touch it when it has the same color as the background.
The background keeps changing color, you will have to be fast and reactive!

There are two directions you can take to decide the rules of the game.
  - the main element will be time
  - the main element will be hit
In the rules below, the main element is hit (*when you tap the square when its color matches the color of the background*). *Hit* is the game dynamics, this is what you do when you play, this is why is keeps the central position for all the rules.

# How do I earn point?
Points are a common language between players to compare their performance and challenge each other. Points in arcade game be the best translation of the player's level as possible.

## ~~Option 1: The longer you survive the more points you'll have~~
## Option 2: You get points when you hit the correct color
Each time you hit you earn ten points time the number of lifes you still have.

### Variables
- `score_factor`: the number of time you multiply you number of lifes (*e.g. ten above*)
- `score_power`: the power at which you elevate your number of lifes (*e.g. one above*)

# What is a combo?
Combo are essential in arcarde game as they give a insentive to continue the perfect strike and guide you to improve your skills.

## Option 1: You don't miss between two hits
After your second hit without miss, you will start a combo. You'll continue the combo until you don't miss.
You miss if:
  - you tap when the square and the background don't have the same color,
  - you don't tape when the square and the background have the same color.

### Variables
- `miss_allowed`: number of miss you can do and still be in a combo (*e.g. one above*)

## ~~Option 2: You don't miss within a time windows~~

# How do I lose the game?
## ~~Option 1: I don't have time left~~
## Option 2: I missed to many times
You start the game with three lifes. Each time you miss you lose a life. The game ends when you lose your last life.
You miss if you tap when the square and the background don't have the same color.

### Variables
- `max_lifes`: maximum number of lifes (*e.g. three above*)
- `start_lifes`: number of lifes when the game starts (*e.g. three above*)

## ~~Option 3: A game is always the same time~~

# ~~How do I lose time?~~
## ~~Option 1: You can't lose time~~
## ~~Option 2: You loss time when you miss~~

# How do I play longer?
## ~~Option 1: You can't play longer~~
## Option 2: You play longer when you hit in a combo
When you hit during a combo, you earn one life. You can never have more than three lifes.

### Variables
- `lifes_earned`: number of life you earn for an hit during a combo (*e.g. one above*)

# How does the difficulty increase?
## ~~Option 1: The difficulty remains the same~~
## ~~Option 2: The difficulty increases during the game~~
## Option 3: The difficulty increases during a combo
Each time you hit during the combo, the background will change color faster.
The background will keep longer its color when it has the same as the color of the square.

>The difficulty ramp will be defined later, as trials and errors are best to find the balance between too easy and too hard.

### Variables
- `background_delta`: time the backgroun keeps its color when it doesn't match the color of the square
- `background_match_delta`: time the background keeps its color when it matches the color of the square