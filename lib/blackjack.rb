def welcome
  puts "Welcome to the Blackjack Table"
  return "Welcome to the Blackjack Table"
end

def deal_card
  r = Random.new
  return r.rand(1...11) 
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
  return "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  $user_input = gets.chomp
return $user_input
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_one = deal_card 
  card_two = deal_card
  total = card_one+card_two
  display_card_total(total)
  return total
end

def hit? (in_total)
  prompt_user
  user_input = get_user_input
  if user_input == 's'
      # puts in_total
      return in_total
    elsif user_input == 'h'
      in_total += deal_card
      # puts in_total
      return in_total
    end 
  while user_input != "s" or user_input != "h"
    invalid_command
    prompt_user
    user_input = get_user_input
    if user_input == 's'
      # puts in_total
      return in_total
    elsif user_input == 'h'
      in_total += deal_card
      # puts in_total
      return in_total
    end 
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner()
  welcome()
  total =  initial_round()
  $user_input = 'h'
  while total <21 && $user_input == 'h'
      total = hit?(total)
      display_card_total(total)
      if $user_input == 's'
        total = hit?(total)
      end
      if total >21
        end_game(total)
      end 
  end
end
    
