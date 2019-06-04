module Interface
  def enter_name
    print "Введите ваше имя: "
  end

  def beginning_game(player)
    puts "#{player.name}, Начать игру?"
    print " Да(1)\n Нет(2)\n >"
  end

  def another_turn(player)
    puts "#{player.name}, еще раз?"
  end

  def shoozes
    puts "__________________\nВыберите количество колод"
    puts "Минимально будет выставлено 1, максимально 8"
    print ">"
  end

  def shooze_counts(counts)
    puts "Выставлено колод: #{counts}"
  end

  def uses_buttom(player)
    puts "__________________\n(1) Пропустить"
    puts "(2) Добавить карту" if !player.finaly? && !player.pip_21?
    puts "(3) Вскрыть"
    print ">"
  end

  def result(player, hand)
    if player.name != "Croupier"
      print "#{hand.show_cards(player)}"
    else
      print "#{hand.visible_cards(player)}"
    end
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

  def end_game
    puts "__________________\nЗавершить игру? (Y/N)"
  end
end
