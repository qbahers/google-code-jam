class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |index|
          recycled_pairs = []

          line = input.readline.chomp.split
          a = line.first.to_i
          b = line.last.to_i

          nb_digits = a.to_s.length

          (a..b).each do |n|
            p = n.to_s.split("")

            (1..nb_digits - 1).each do |i|
              q = "" 

              (0..nb_digits - 1).each do |j|
                q += p[(i + j) % nb_digits]
              end

              m = q.to_i
              recycled_pair = [n, m].sort

              if m != n && m >= a && m <= b && 
                 !recycled_pairs.include?(recycled_pair)
                recycled_pairs << recycled_pair
              end
            end
          end
          
          nb_recycled_pairs = recycled_pairs.size

          output.write("Case ##{index + 1}: #{nb_recycled_pairs}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('C-small-practice.in')
#problem.solve('C-large-practice.in')

