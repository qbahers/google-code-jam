class Problem

  def get_monks_whispering(monk, followers, whisperers = [monk])
    followers[monk].each do |follower|
      if !whisperers.include?(follower)
        whisperers << follower
          
        if !followers[follower].nil?
          get_monks_whispering(follower, followers, whisperers)
        end
      end
    end
    whisperers
  end
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        (1..t).each do |case_number|
          output.write("Case ##{case_number}:\n")

          followers = Hash.new { |h, k| h[k] = [] }

          n = input.readline.chomp.to_i

          line = input.readline.chomp.split.map { |x| x.to_i }

          line.each_with_index do |monk, index|
            follower = index + 1
            followers[monk] << follower
          end

          (1..n).each do |monk|
            monks_whispering = get_monks_whispering(monk, followers)

            nb_monks_whispering = monks_whispering.size

            output.write("#{nb_monks_whispering}\n")
          end
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('D-small-practice.in')
problem.solve('D-large-practice.in')

