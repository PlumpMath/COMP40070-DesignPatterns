require_relative 'oracle.rb'
require_relative 'play.rb'

class PlayBinarySearch < Play
  attr_reader :num_attempts

  def initialize(num_attempts, max_num_attempts)
    @num_attempts = num_attempts
    @max_num_attempts = max_num_attempts
  end

  def prepare_play(context)
    @num = (context.lower+context.upper)/2
    @num_attempts+=1
  end

  def execute_play(context)
    while ((result = context.oracle.is_this_the_number?(@num)) != :correct) && (@num_attempts <= @max_num_attempts) do
      # puts "#{__method__}:I guessed #{num}"
      if result == :less_than
        context.upper = @num-1
      elsif result == :greater_than
        context.lower = @num+1
      end
      @num=(context.lower+context.upper)/2
      @num_attempts+=1
    end
  end

  def return_result
    #puts 'num_attempts on return_result ' + @num_attempts.to_s
    if (@num_attempts <= @max_num_attempts)
      #puts "#{__method__}: Yippee, I guessed #{@num} and won!"
      return @num_attempts, :success
    else
      fail
    end
  end

end