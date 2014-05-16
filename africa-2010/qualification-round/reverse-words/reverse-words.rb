class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          line = input.readline.chomp.split.reverse.join(' ')
          #p line

          output.write("Case ##{index + 1}: #{line}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

#problem.solve('sample.in')
problem.solve('B-small-practice.in')
problem.solve('B-large-practice.in')

