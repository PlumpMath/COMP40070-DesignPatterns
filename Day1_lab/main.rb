
# Evaluate the performance of participants using different guessing strategies

require_relative 'oracle.rb'
require_relative 'participant.rb'

NUM_OF_RUNS = 8

oracle = Oracle.new

# evaluate random strategy
begin
  play_random = PlayRandom.new(0, NUM_OF_RUNS*2)
  total_num_attempts = 0
  total_num_failures = 0
  homer = Participant.new(oracle, max_num_attempts: NUM_OF_RUNS*2)
  1.upto(NUM_OF_RUNS) do |i|
    oracle.secret_number = i
    homer.reset
    if homer.play(1, NUM_OF_RUNS, play_random)==:success
      # puts "play randomly found #{i} in #{homer.num_attempts} attempts"
      total_num_attempts += homer.num_attempts
    else
      # puts "play randomly failed to find #{i} after #{homer.num_attempts} attempts"
      total_num_failures += 1
    end
  end
  puts "play randomly took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
end


# evaluate linear strategy
begin
  play_linear = PlayLinear.new(0, NUM_OF_RUNS*2)
  total_num_attempts = 0
  total_num_failures = 0
  bart = Participant.new(oracle, max_num_attempts:NUM_OF_RUNS*2)
  1.upto(NUM_OF_RUNS) do |i|
    oracle.secret_number = i
    bart.reset
    if bart.play(1, 999, play_linear)==:success
      #puts "play_linear found #{i} in #{bart.num_attempts} attempts"
      total_num_attempts += bart.num_attempts
    else
      #puts "play_linear failed to find #{i} after #{bart.num_attempts} attempts"
      total_num_failures += 1
    end
  end
  puts "play_linear took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
end

# evaluate 'smart random' strategy
begin
  play_smart_random = PlaySmartRandom.new(0, NUM_OF_RUNS*5)
  total_num_attempts = 0
  total_num_failures = 0
  maggie = Participant.new(oracle, max_num_attempts:NUM_OF_RUNS*5)
  1.upto(NUM_OF_RUNS) do |i|
    oracle.secret_number = i
    maggie.reset
    #if maggie.play_smart_random(1,NUM_OF_RUNS)==:success
    if maggie.play(1,NUM_OF_RUNS, play_smart_random)==:success
      # puts "play_smart_random found #{i} in #{maggie.num_attempts} attempts"
      # puts 'total_num_attempts '  +  total_num_attempts.to_s
      total_num_attempts += maggie.num_attempts
    else
      #puts "play_smart_random failed to find #{i} after #{maggie.num_attempts} attempts"
      total_num_failures += 1
    end
  end
  #puts 'total_num_attempts '  + total_num_attempts.to_s
  #puts 'NUM_OF_RUNS ' + NUM_OF_RUNS.to_s
  #puts 'total_num_failures ' + total_num_failures.to_s
  #puts 'Oracle secre number ' + oracle.secret_number.to_s
  puts "play_smart_random took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
end


# evaluate binary search strategy
play_binary_search = PlayBinarySearch.new(0, NUM_OF_RUNS*5)
total_num_attempts = 0
total_num_failures = 0
lisa = Participant.new(oracle, max_num_attempts:NUM_OF_RUNS*5)
1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  lisa.reset
  if lisa.play(1,NUM_OF_RUNS, play_binary_search)==:success
    # puts "play_binary_search found #{i} in #{lisa.num_attempts} attempts"
    total_num_attempts += lisa.num_attempts
  else
    # puts "play_binary_search failed to find #{i} after #{lisa.num_attempts} attempts"
    total_num_failures += 1
  end
end
puts "play_binary_search took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"

# evaluate reverse linear strategy
begin
  play_reverse_linear = PlayReverseLinear.new(0, NUM_OF_RUNS*2)
  total_num_attempts = 0
  total_num_failures = 0
  apu = Participant.new(oracle, max_num_attempts:NUM_OF_RUNS*2)
  1.upto(NUM_OF_RUNS) do |i|
    oracle.secret_number = i
    bart.reset
    if bart.play(1, NUM_OF_RUNS, play_reverse_linear)==:success
      #puts "play_linear found #{i} in #{bart.num_attempts} attempts"
      total_num_attempts += bart.num_attempts
    else
      #puts "play_linear failed to find #{i} after #{bart.num_attempts} attempts"
      total_num_failures += 1
    end
  end
  puts "play_reverse_linear took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
end