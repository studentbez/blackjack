#карта(масть, значение)
#подсчитывает количество очков для карты

class Card
  attr_accessor :suit, :value

  SUIT = ["\u2660", "\u2663", "\u2666", "\u2665"]
  VALUE_OF_CARD = ["A", "K", "Q", "J", 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  #метод подсчета кол-ва очков
  def point
    if ["K", "Q", "J"].include?(@value)#проверка на имение значения в массиве
      10
    elsif @value == "A"
      [11, 1]
    else
      @value.to_i
    end      
  end
end
