class Play
  attr_writer :play_type
  attr_accessor :lower, :upper, :oracle

  def initialize(play_type, lower, upper, oracle)
    @play_type = play_type
    @lower = lower
    @upper = upper
    @oracle = oracle
  end

  def play
    @play_type.prepare_play(self)
    @play_type.execute_play(self)
    @play_type.return_result
  end

  def fail
    #puts "Boo hoo. I made #{@num_attempts} attempts and failed."
    :fail
  end


end


