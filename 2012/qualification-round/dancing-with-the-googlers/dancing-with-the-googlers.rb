class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          line = input.readline.chomp.split.map { |e| e.to_i }

          n = line[0]
          s = line[1]
          p = line[2]
          total_points = line.drop(3)

          worse = [] # Best results if s = 0
          best  = [] # Best results if s = n

          total_points.each do |e|
            case
            when e % 3 == 0
              worse << e / 3
              e > 0 ? best << e / 3 + 1 : best << 0
            when e % 3 == 1
              worse << e / 3 + 1
              best << e / 3 + 1
            else
              worse << e / 3 + 1
              best << e / 3 + 2
            end
          end

          min_nb_googlers = worse.count { |e| e >= p }
          max_nb_googlers = best.count { |e| e >= p }

          result = min_nb_googlers + [max_nb_googlers - min_nb_googlers, s].min

          output.write("Case ##{i + 1}: #{result}\n")
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

