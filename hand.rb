class Hand
  attr_accessor :cards

  def initialize
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

  #скрытые карты
  def invisible_cards
    @cards.collect { |card| card = "*" } * ""
  end

  #показывает карты
  def visible_cards
    @cards.collect {|card| "#{card.value}#{card.suit}"} * " "
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

  def limit?
    points > 17
  end
end
