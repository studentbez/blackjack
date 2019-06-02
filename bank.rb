#объект класса Банк принимает ставки, хранит значение
#ставит обнуляет

class Bank
  attr_reader :value
  #изначально ноль
  def initialize
    @value ||= 0
  end
  #принимает ставку
  def take(bet)
    @value += bet
  end
  #выплачивает выигрышь
  def give_win
    value = @value
    @value = 0
    value
  end
end
