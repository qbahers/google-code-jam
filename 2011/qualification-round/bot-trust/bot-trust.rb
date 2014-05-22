class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |index|
          line = input.readline.chomp.split

          n = line.shift.to_i

          sequence = []
          (0..2*n-1).step(2) do |i|
            sequence << [line[i], line[i + 1].to_i]
          end
          
          position_O = 1
          position_B = 1

          nb_seconds_O = 0
          nb_seconds_B = 0

          nb_seconds = 0

          sequence.each do |e|
            if (e.first == 'O')
              nb_seconds_O += (e.last - position_O).abs + 1

              waiting_time = nb_seconds - (nb_seconds_O - 1)
              nb_seconds_O += waiting_time if (waiting_time > 0)

              position_O = e.last
              nb_seconds = nb_seconds_O
            else
              nb_seconds_B += (e.last - position_B).abs + 1
              
              waiting_time = nb_seconds - (nb_seconds_B - 1)
              nb_seconds_B += waiting_time if (waiting_time > 0)
              
              position_B = e.last
              nb_seconds = nb_seconds_B
            end
          end

          output.write("Case ##{index + 1}: #{nb_seconds}\n")
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

