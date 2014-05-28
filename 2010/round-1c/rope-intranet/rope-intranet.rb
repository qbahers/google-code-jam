class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          n = input.readline.chomp.to_i

          connections = {}
          n.times do 
            connection = input.readline.chomp.split.map { |x| x.to_i }
            connections[connection.first] = connection.last
          end

          nb_intersections = 0

          connections.each do |left_endpoint1, right_endpoint1|
            connections.each do |left_endpoint2, right_endpoint2|
              if (left_endpoint2 > left_endpoint1 && 
                 right_endpoint2 < right_endpoint1) ||
                 (left_endpoint2 < left_endpoint1 &&
                 right_endpoint2 > right_endpoint1)
                 nb_intersections += 1
              end
            end
          end

          nb_intersections /= 2
          
          output.write("Case ##{i + 1}: #{nb_intersections}\n")
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

