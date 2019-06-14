class Interface
  def initialize
    puts "---------------------------------"
    puts "Добро пожаловать в игру БлэкДжек!"
    puts "---------------------------------"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  end

  def enter_name
    print "Введите ваше имя: "
  end

  def beginning_game
    puts "Начать игру?"
    print " Да(1)\n Нет(2)\n >"
  end

  def another_turn(player)
    puts "#{player.name}, еще раз?"
  end

  def packs_in_shooze
    puts "Выберите количество колод"
    puts "Минимально будет выставлено 1, максимально 8"
    print ">"
  end

  def counts_of_packcard(counts)
    puts "Выставлено колод: #{counts}"
  end

  def buttoms(player)
    puts "\n(1) Пропустить"
    puts "(2) Добавить карту" if !player.finaly? && !player.pip_21?
    puts "(3) Вскрыть"
    print ">"
  end

  def result(player, hand)
    puts "Карты #{player.name}: #{hand.visible_cards}"
    puts "Итоговые очки: #{hand.points}"
  end

  def win_text(player)
    puts "Выиграл #{player.name}, банк: #{player.bank}"
  end

  def lose_text(player)
    puts "#{player.name} проиграл, банк: #{player.bank}"
  end

  def draw_text
    puts "Ничья"
  end

  def restart_game
    puts "__________________\nЗавершить игру? (Y/N)"
  end

  def show_cards(player, hand)
    puts "Карты #{player.name}: #{hand} "
  end

  def end_game
    puts "Больше нет денег"
    puts "__________________\nЗавершить игру? (Y/N)"
  end
end
