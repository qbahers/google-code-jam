class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i
        #p nb_test_cases

        nb_test_cases.times do |index|
          line = input.readline.chomp.split
          #p line

          nb_devices = line[0].to_i
          #p nb_devices

          nb_snaps = line[1].to_i
          #p nb_snaps

          state = (nb_snaps + 1) % (2**nb_devices)
          #p state

          res = (state == 0) ? "ON" : "OFF"
          #p res

          #p "Case ##{index + 1}: #{res}"
          output.write("Case ##{index + 1}: #{res}\n")
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

