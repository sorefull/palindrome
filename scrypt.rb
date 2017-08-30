time_start = Time.now

def is_simple?(n)
  sqrt_n = Math.sqrt(n)
  (2..sqrt_n).each do |i|
    return false if n % i == 0
  end
  return true
end

start_simple = 10_000
finish_simple = 99_999
simples = []

(start_simple..finish_simple).each do |number|
  simples << number if is_simple?(number)
end

min_polyndrom_half = 10_000
polyndrom_half = 99_997

loop do
  half_string = polyndrom_half.to_s
  full_string = half_string + half_string.reverse
  current_polyndrom = full_string.to_i

  simples.each do |simple|
    if simples.include?(current_polyndrom / simple)
      puts current_polyndrom
      puts simple
      puts current_polyndrom / simple

      puts "Time spend: #{Time.now - time_start}"
      exit!
    end
  end

  polyndrom_half -= 2
  break if polyndrom_half < min_polyndrom_half
end
