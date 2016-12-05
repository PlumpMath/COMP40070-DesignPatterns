require_relative 'play_random.rb'
require_relative 'play_smart_random.rb'
require_relative 'play_binary_search.rb'
require_relative 'play_linear.rb'
require_relative 'play_reverse_linear.rb'
require_relative 'oracle.rb'

# Tries to guess the 'secret' number using several different strategies
class Participant
  attr_reader :num_attempts

  def initialize(oracle, max_num_attempts:10)
    @oracle, @max_num_attempts = oracle, max_num_attempts
    @num_attempts = 0
  end

  def reset
    @num_attempts = 0
  end

  def play(lower, upper, player_type)
    result = Play.new(player_type, lower, upper, @oracle)
    @num_attempts, result = result.play
    #puts 'num_attempts, result ' + num_attempts.to_s + ' ' + result.to_s
    result

  end

end