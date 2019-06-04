#класс игрок(имя, деньги) 
#делает ставку

class Player
  attr_accessor :name, :bank, :bet

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
    @bet = 0
  end
  #метод делает ставку
  def rate
    raise puts "Больше нет денег" if @bank.zero?
    @bank -= 10
  end
  #метод забирает выигрышь
  def take_win(credits)
    @bank += credits
  end
  #тут был метод показывания карт
end
