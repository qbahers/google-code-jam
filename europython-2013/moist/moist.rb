class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |index|
          deck = []
          nb_dollars = 0

          n = input.readline.chomp.to_i

          n.times do
            card = input.readline.chomp
            deck << card
          end

          (1..n-1).each do |i|
            if deck[i] < deck[i - 1]
              (0..i-1).each do |j|
                if deck[i] < deck[j]
                  deck.insert(j, deck[i])
                  deck.delete_at(i + 1)
                  nb_dollars += 1
                  break
                end
              end
            end
          end
          
          output.write("Case ##{index + 1}: #{nb_dollars}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('A-small-practice-1.in')
problem.solve('A-small-practice-2.in')

