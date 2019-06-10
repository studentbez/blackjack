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
    Card::SUIT.each do |suit|#присваиваем масть и значение карте
      Card::VALUE_OF_CARD.each do |value|
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
