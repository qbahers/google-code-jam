class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        letter_to_digit = {
          "a" => "2", "b" => "22", "c" => "222",
          "d" => "3", "e" => "33", "f" => "333",
          "g" => "4", "h" => "44", "i" => "444",
          "j" => "5", "k" => "55", "l" => "555",
          "m" => "6", "n" => "66", "o" => "666",
          "p" => "7", "q" => "77", "r" => "777", "s" => "7777",
          "t" => "8", "u" => "88", "v" => "888",
          "w" => "9", "x" => "99", "y" => "999", "z" => "9999",
          " " => "0" }

        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          output.write("Case ##{index + 1}: ")

          message = input.readline.chomp.split("")

          digit = -1
          message.each do |c|
            new_digit = letter_to_digit[c]

            output.write(" ") if new_digit[0] == digit
            output.write(new_digit)

            digit = new_digit[0]
          end

          output.write("\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('C-small-practice.in')
problem.solve('C-large-practice.in')

