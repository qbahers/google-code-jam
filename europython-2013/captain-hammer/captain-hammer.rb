class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          line = input.readline.chomp.split.map { |x| x.to_i }

          v = line.first
          d = line.last

          g = 9.8

          x = g * d / v**2
          x = 1 if x > 1

          theta = 90 / Math::PI * Math.asin(x)
          
          output.write("Case ##{i + 1}: #{theta.round(7)}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

#problem.solve('sample.in')
problem.solve('B-small-practice.in')

