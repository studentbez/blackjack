#карта(масть, значение)
#подсчитывает количество очков для карты

class Card
  attr_accessor :suit, :value

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
