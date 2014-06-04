class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        vowels = ['a', 'e', 'i', 'o', 'u']

        t = input.readline.chomp.to_i

        t.times do |i|
          c = input.readline.chomp
         
          last_character = c[-1].downcase

          if last_character == 'y'
            z = "nobody"
          elsif vowels.find_index(last_character)
            z = "a queen"
          else
            z = "a king"
          end

          output.write("Case ##{i + 1}: #{c} is ruled by #{z}.\n")
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

