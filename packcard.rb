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
  def shuffle
    @cards.shuffle!#тасованиe карт
  end
  
  #метод удаления карт из колоды на стол
  def give_a_card
    @cards.shift
  end
end
