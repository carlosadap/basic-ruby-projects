# PROJECT: MASTERMIND

## Introduction

If you’ve never played Mastermind, a game where you have to guess your opponent’s secret code within a certain number of turns (like hangman with colored pegs), check it out on [Wikipedia](http://en.wikipedia.org/wiki/Mastermind_(board_game)). Each turn you get some feedback about how good your guess was – whether it was exactly correct or just the correct color but in the wrong space.

## Assignment

Build a Mastermind game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.

1. Think about how you would set this problem up!

2. Build the game assuming the computer randomly selects the secret colors and the human player must guess them. Remember that you need to give the proper feedback on how good the guess was each turn!

3. Now refactor your code to allow the human player to choose whether he/she wants to be the creator of the secret code or the guesser.

4. Build it out so that the computer will guess if you decide to choose your own secret colors. You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.

5. If you choose to modify the rules, you can provide the computer additional information about each guess. For example, you can start by having the computer guess randomly, but keep the ones that match exactly. You can add a little bit more intelligence to the computer player so that, if the computer has guessed the right color but the wrong position, its next guess will need to include that color somewhere.

6. If you want to follow the rules of the game, you’ll need to research strategies for solving Mastermind, such as this [post](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind).

7. Post your solution below!

---

## How to play

### Basic instructions

1. Open your favorite ruby REPL (pry)

2. load the game file (load 'game.rb')

3. Create you game instance (g = Game.new)

4. Run the game (g.run)

5. Have fun!

### Getting schwifty

- If you want more challenge, you can change the number of pegs and the number of turns by initializing the game with 'Game.new(number_of_pegs, max_turns)'.

- The available colors can be tweeked by changing (adding more words) the line 10 of the game.rb file. Don't use 'blank' as a color.

- You can enter the 'debugging mode' by uncommenting the line 64 of the game.rb, this will show you the secret_code.

---

This project is a part of [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/mastermind)