class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i
        
        t.times do |i|
          line = input.readline.chomp.split.map { |x| x.to_f }
          c = line[0]
          f = line[1]
          x = line[2]

          time = 0
          rate = 2
          total_time = x / rate

          while time + c / rate + x / (rate + f) < total_time
            time += c / rate
            rate += f
            total_time = time + x / rate
          end

          output.write("Case ##{i + 1}: #{total_time.round(7)}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('B-small-practice.in')
problem.solve('B-large-practice.in')

