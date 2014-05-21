class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        n = input.readline.chomp.to_i

        n.times do |i|
          t = input.readline.chomp.to_i

          line = input.readline.chomp.split.map { |e| e.to_i }
          na = line.first
          nb = line.last
          
          departures_a = []
          arrivals_b   = []
          
          na.times do
            trip = input.readline.chomp.split.map do |time|
              time = time.split(':').map { |e| e.to_i }
              time.first * 60 + time.last
            end
             departures_a << trip.first
             arrivals_b   << trip.last + t
          end

          departures_a.sort!
          arrivals_b.sort!

          departures_b = []
          arrivals_a   = []

          nb.times do 
            trip = input.readline.chomp.split.map do |time|
              time = time.split(':').map { |e| e.to_i }
              time.first * 60 + time.last
            end
             departures_b << trip.first
             arrivals_a   << trip.last + t
          end

          departures_b.sort!
          arrivals_a.sort!

          nb_trains_a = 0
          departures_a.each do |d|
            arrival = arrivals_a.detect { |a| a <= d }

            if !arrival
              nb_trains_a += 1
            else
              arrivals_a.shift
            end
          end

          nb_trains_b = 0
          departures_b.each do |d|
            arrival = arrivals_b.detect { |a| a <= d }

            if !arrival
              nb_trains_b += 1
            else
              arrivals_b.shift
            end
          end

          output.write("Case ##{i + 1}: #{nb_trains_a} #{nb_trains_b}\n")
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

