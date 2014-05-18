class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          output.write("Case ##{index + 1}: ")

          credit   = input.readline.chomp.to_i
          nb_items = input.readline.chomp.to_i
          prices   = input.readline.chomp.split.map { |p| p.to_i }

          catch (:done) do
            for i in 0..(nb_items - 1)
              for j in (i + 1)..(nb_items - 1)
                sum = prices[i] + prices[j]

                if (sum == credit)
                  output.write("#{[i + 1, j + 1].min} #{[i + 1, j + 1].max}\n")
                  throw :done
                end
              end
            end
          end

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

