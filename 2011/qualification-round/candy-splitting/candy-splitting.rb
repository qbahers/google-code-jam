class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          n = input.readline.chomp.to_i
          candies = input.readline.chomp.split.map { |x| x.to_i }

          sum = candies.reduce(:^)

          if sum == 0
            candies.sort!
            result = candies.drop(1).reduce(:+)
          else
            result = "NO"
          end
          
          output.write("Case ##{i + 1}: #{result}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('C-small-practice.in')
problem.solve('C-large-practice.in')

