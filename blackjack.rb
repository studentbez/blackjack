#класс объекта "игра""
require_relative 'interface'

class Blackjack
  include Interface
  attr_accessor :player, :dealer, :shooze, :bank, :player_hand, :dealer_hand
  #создаем дилера и игрока
  def initialize
    @dealer = Dealer.new()
    @dealer_hand = Hand.new
    @player = Player.new("Игрок")
    @player_hand = Hand.new
    @bank = Bank.new
  end
  #вводим имя
  def new_game
    enter_name
    @player.name = gets.chomp
    begin_game
  end
  #начинаем игру
  def begin_game
    loop do
      beginning_game(@player)
      choice = gets.chomp.to_i
      picked(choice)
    end
  end

  def picked(choice)
    case choice
    when 1 then beginning
    when 2 then restart
    else
      another_turn(@player)
      begin_game
    end
    end
  end
  #управляющие клавиши
  def start
    @player_hand.show_cards(@player)
    @dealer_hand.show_cards(@dealer)
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
    distribution
    [@player, @dealer].each do |player|
    begin
      bank.take(10)
      player.rate
    rescue Exception => e
      puts e.message
      restart
    end
    end
    start
  end

  def distribution
    [@player_hand, @dealer_hand].each do |hand|
      hand.cards = []
      2.times { take_card(hand) }
    end
  end

  #создание колод
  def create_shooze
    #создать колоды 1 - 8
    shoozes
    counts = gets.chomp.to_i
    if counts < 1
      counts = 1
    elsif counts > 8
      counts = 8
    else
      counts
    end
    shooze_counts(counts)
    @shooze = Packcard.new
    counts.times { @shooze.create_packcard }
    @shooze.shufll!
  end
  #метод управления игрой игрока
  def player_menu
    uses_buttom(@player_hand)
    gets.chomp.to_i
  end
  #выдает карты
  def take_card(hand)
    hand.cards << @shooze.to_give_a_card
  end
  #черед игрока
  def player_turn
    take_card(@player_hand) if !@player_hand.finaly?
    dealer_turn
  end
  #черед дилера
  def dealer_turn
    take_card(@dealer_hand) if !@dealer_hand.limit? && !@dealer_hand.finaly?
    open_cards
    win
  end
  #вскрываем карты
  def open_cards
    result(@player, @player_hand)
    result(@dealer, @dealer_hand)
  end
  #проверка на выигрышь
  def win
    player_criterion = !@player_hand.fail? && @player_hand.points > @dealer_hand.points
    dealer_criterion = !@dealer_hand.fail? && @dealer_hand.points > @player_hand.points
    if @dealer_hand.fail? || @player_hand.pip_21? || player_criterion
      player_wins
    elsif @player_hand.fail? || @dealer_hand.pip_21? || dealer_criterion
      dealer_wins
    else
      equal_wins
    end
    another_turn(@player)
    begin_game
  end

  def player_wins
    @player.take_win(@bank.give_win)
    win_text(@player)
    lose_text(@dealer)
  end

  def dealer_wins
    @dealer.take_win(@bank.give_win)
    win_text(@dealer)
    lose_text(@player)
  end

  def equal_wins
    draw_text
    @player.take_win(no_wins)
    @dealer.take_win(no_wins)
  end

  def no_wins
    @bank.give_win / 2
  end
  #перезапуск?
  def restart
    end_game
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

