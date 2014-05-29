class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |index|
          line = input.readline.chomp.split.map { |x| x.to_i }
          n = line.first
          m = line.last

          pattern = []

          n.times do
            row = input.readline.chomp.split.map { |x| x.to_i }
            pattern << row
          end
          
          transpose_pattern = pattern.transpose

          result = "YES"

          catch (:impossible) do
            (0..(n - 1)).each do |i|
              (0..(m - 1)).each do |j|
                height = pattern[i][j]
                unless ((height >= transpose_pattern[j].max) || 
                        (height >= pattern[i].max))
                  result = "NO"
                  throw :impossible
                end
              end
            end
          end
          
          output.write("Case ##{index  + 1}: #{result}\n")
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

