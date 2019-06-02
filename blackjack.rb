#класс объекта "игра""

class Blackjack
  attr_accessor :player, :dealer, :shooze, :bank
  #создаем дилера и игрока
  def initialize
    @dealer = Dealer.new()
    @player = Player.new("Игрок")
    @bank = Bank.new
  end
  #вводим имя
  def new_game
    print "Введите ваше имя: "
    @player.name = gets.chomp
    begin_game
  end
  #начинаем игру
  def begin_game
    loop do
      puts "#{@player.name}, Начать игру?"
      print " Да(1)\n Нет(2)\n >"
      choice = gets.chomp.to_i
      picked(choice)
    end
  end

  def picked(choice)
    case choice
    when 1 then beginning
    when 2 then restart
    else
      puts "#{@player.name}, попробуйте еще раз"
      begin_game
    end
    end
  end
  #управляющие клавиши
  def start
    @player.show_cards
    @dealer.show_cards
    buttoms(player_menu)
  end

  def buttoms(pick)
    case pick
    when 1 then dealer_turn
    when 2 then player_turn
    when 3 then open_pack
    else
      start
    end
  end
  #вскрыть, проверить на выигрышь
  def open_pack
    open_cards
    win
  end
  #метод создает колоду, раздает карты, делает ставку, показывает карты
  def beginning
    create_shooze
    [@player, @dealer].each do |player|
      player.cards = []
      2.times { take_card(player) }
      bank.take(10)
      player.rate
    rescue Exception => e
      puts e.message
      restart
    end
    start
  end
  #создание колод
  def create_shooze
    #создать колоды 1 - 8
    puts "__________________\nВыберите количество колод"
    puts "Минимально будет выставлено 1, максимально 8"
    print ">"
    counts = gets.chomp.to_i
    if counts < 1
      counts = 1
    elsif counts > 8
      counts = 8
    else
      counts
    end
    puts "Создано #{counts} колод"
    @shooze = Packcard.new
    counts.times { @shooze.create_packcard }
    @shooze.shufll!
  end
  #метод управления игрой игрока
  def player_menu
    puts "__________________\n(1) Пропустить"
    puts "(2) Добавить карту" if !@player.finaly? && !@player.pip_21?
    puts "(3) Вскрыть"
    print ">"
    gets.chomp.to_i
  end
  #выдает карты
  def take_card(player)
    player.cards << @shooze.to_give_a_card
  end
  #черед игрока
  def player_turn
    take_card(@player) if !@player.finaly?
    dealer_turn
  end
  #черед дилера
  def dealer_turn
    take_card(@dealer) if !@dealer.limit? && !@dealer.finaly?
    open_cards
    win
  end
  #вскрываем карты
  def open_cards
    print "#{@player.show_cards}"
    puts "Итоговые очки: #{@player.points}"
    print "#{@dealer.visible_cards}"
    puts "Итоговые очки: #{@dealer.points}"
  end
  #проверка на выигрышь
  def win
    if @dealer.fail? || @player.pip_21? || (!@player.fail? && @player.points > @dealer.points)
      player_wins
    elsif @player.fail? || @dealer.pip_21? || (!@dealer.fail? && @dealer.points > @player.points)
      dealer_wins
    else
      equal_wins
    end
    puts "Ещё раз?"
    begin_game
  end

  def player_wins
    puts "Выиграл #{@player.name}"
    player.take_win(@bank.give_win)
    puts "Банк #{@player.name}: #{@player.bank}, #{@dealer.name}: #{@dealer.bank}"
  end

  def dealer_wins
    puts "Выиграл #{@dealer.name}"
    dealer.take_win(@bank.give_win)
    puts "Банк #{@player.name}: #{@player.bank}, #{@dealer.name}: #{@dealer.bank}"
  end

  def equal_wins
    puts "Ничья"
    @player.take_win(no_wins)
    @dealer.take_win(no_wins)
    puts "Банк #{@player.name}: #{@player.bank}, #{@dealer.name}: #{@dealer.bank}"
  end

  def no_wins
    @bank.give_win / 2
  end
  #перезапуск?
  def restart
    puts "__________________\nЗавершить игру? (Y/N)"
    answer = gets.chomp.to_s
    restart_answer(answer)
  end

  def restart_answer(answer)
    case answer
    when "Y" then exit
    when "N" then begin_game
    else
      restart
  end
end

