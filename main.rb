#начало игры
require_relative "card"
require_relative "packcard"
require_relative "player"
require_relative "dealer"
require_relative "bank"
require_relative "blackjack"

game = Blackjack.new
game.new_game
