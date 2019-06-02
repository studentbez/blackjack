#класс Дилер потомок игрока
#проверяет количество очков

class Dealer < Player
  def initialize(name = "Croupier")
    super
  end
  #метод проверяет количество очков
  def limit?
    self.points > 17
  end
  #показывает карты
  def show_cards
    puts "Карты #{name}: #{@cards.collect { |card| card = "*" } * ""}"
  end

  def visible_cards
    puts "Карты #{name}: #{@cards.collect {|card| "#{card.value}#{card.suit}"} * " "}"
  end 
end
