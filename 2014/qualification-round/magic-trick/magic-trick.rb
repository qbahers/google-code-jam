class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i
        #p nb_test_cases

        nb_test_cases.times do |index|
          answers = []
          arrangements = [[], []]

          2.times do |index|
            answers[index] = input.readline.chomp.to_i

            4.times do 
              row = input.readline.chomp.split
              arrangements[index] << row
            end
          end

          #p answers
          #p arrangements

          possible_cards = arrangements[0][answers[0] - 1] &
                           arrangements[1][answers[1] - 1]
          #p possible_cards

          answer = ""
          nb_possible_cards = possible_cards.length

          if nb_possible_cards == 0
            answer = "Volunteer cheated!"
          elsif nb_possible_cards == 1
            answer = possible_cards.first
          else
            answer = "Bad magician!"
          end

          #p "Case ##{index + 1}: #{answer}"
          output.write("Case ##{index + 1}: #{answer}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('A-small-practice.in')

