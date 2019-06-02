#класс игрок(имя, деньги) 
#имеет массив с объектами класса Карта
#считает очки
#делает ставку
#следит за картами в руке(=3)
class Player
  attr_accessor :name, :bank, :cards, :bet

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
    @bet = 0
    @cards = []
  end
  #метод подсчитывает очки
  def points
    points = 0
    @cards.each do |card| #для каждой карты подсчитываем очки
      if card.value == "A" && points <= 10
        points += card.point.first
      elsif card.value == "A"
        points += card.point.last
      else
        points += card.point
      end
    end
    points
  end
  #метод устанавливает предел в три карты
  def finaly?
    @cards.size == 3
  end
  #проверка на превышение 21
  def fail?
    points > 21
  end
  #или равенство 21
  def pip_21?
    points == 21
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
  #показывает карты
  def show_cards
    puts "Карты #{name}: #{@cards.collect {|card| "#{card.value}#{card.suit}"} * " "}"
  end
end
