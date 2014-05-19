class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          nb_hosts = input.readline.chomp.to_i

          codes = input.readline.chomp.split.map { |code| code.to_i }
          sorted_codes = codes.sort

          i = 0
          while (((i + 1) < nb_hosts) && 
                 (sorted_codes[i] == sorted_codes[i + 1]))
            i += 2
          end

          output.write("Case ##{index + 1}: #{sorted_codes[i]}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('A-small-practice.in')
problem.solve('A-large-practice.in')

