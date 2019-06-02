#колода-создает массив из 52 объектов класса "карта"
#имеет массив значений и массив мастей
#может тасовать карты
#удаляет карты из колоды на стол

class Packcard
  attr_accessor :cards

  def initialize
    @cards = []
  end
  #метод создания колоды
  def create_packcard
    suit = ["\u2660", "\u2663", "\u2666", "\u2665"]#массив мастей
    value = [ "A", "K", "Q", "J", 10, 9, 8, 7, 6, 5, 4, 3, 2]
    suit.each do |suit|#присваиваем масть и значение карте
      value.each do |value|
        cards << Card.new(suit, value)
      end
    end
  end
  #тасует карты
  def shufll!
    @cards.shuffle!#тасованиe карт
  end
  #метод удаления карт из колоды на стол
  def to_give_a_card
    @cards.shift
  end
end
