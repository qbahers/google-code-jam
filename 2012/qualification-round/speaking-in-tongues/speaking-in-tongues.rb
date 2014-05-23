class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        mapping = { 
          'a' => 'y', 'b' => 'h', 'c' => 'e', 'd' => 's', 'e' => 'o',
          'f' => 'c', 'g' => 'v', 'h' => 'x', 'i' => 'd', 'j' => 'u',
          'k' => 'i', 'l' => 'g', 'm' => 'l', 'n' => 'b', 'o' => 'k',
          'p' => 'r', 'q' => 'z', 'r' => 't', 's' => 'n', 't' => 'w',
          'u' => 'j', 'v' => 'p', 'w' => 'f', 'x' => 'm', 'y' => 'a',
          'z' => 'q', ' ' => ' ' }

        t = input.readline.chomp.to_i

        t.times do |i|
          line = input.readline.chomp
          result = line.split('').map { |c| mapping[c] }.join

          output.write("Case ##{i + 1}: #{result}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('A-small-practice.in')

