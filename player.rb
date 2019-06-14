class Player
  attr_accessor :name, :bank, :bet

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
    @bet = 0
  end

  #метод делает ставку
  def rate
    @bank -= 10
  end

  #метод забирает выигрышь
  def take_win(credits)
    @bank += credits
  end
end
