class Problem
 
  def check_rows(board, output)
    board.each do |row|
      if (row.first == "X" || row.first == "O")
        symbol = row.first
      else
        symbol = row[1]
      end
      count = row.count(symbol)
      t_symbol = row.include?("T")

      if ((symbol == "X" || symbol == "O") &&   
          (count == 4 || (count == 3 && t_symbol)))
        output.write("#{symbol} won")
        return true
      end
    end
    false
  end

  def check_first_diagonal(board, output)
    if (board.first.first == "X" || board.first.first == "O")
      symbol = board.first.first
    else
      symbol = board[1][1]
    end
    count = 0
    t_symbol = false

    board.each_with_index do |row, i|
      if row[i] == symbol
        count += 1
      elsif row[i] == "T"
        t_symbol = true  
      end
    end

    if ((symbol == "X" || symbol == "O") &&   
        (count == 4 || (count == 3 && t_symbol)))
      output.write("#{symbol} won")
      return true
    end
    false
  end

  def check_second_diagonal(board, output) 
    if (board.first.last == "X" || board.first.last == "O")
      symbol = board.first.last
    else
      symbol = board[1][2]
    end
    count = 0
    t_symbol = false

    board.each_with_index do |row, i|
      if row[3 - i] == symbol
        count += 1
      elsif row[3 - i] == "T"
        t_symbol = true  
      end
    end

    if ((symbol == "X" || symbol == "O") &&   
        (count == 4 || (count == 3 && t_symbol)))
      output.write("#{symbol} won")
      return true
    end
    false
  end

  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          board = []

          4.times do
            line = input.readline.chomp
            row  = line.split(//)
            board << row
          end

          empty_line = input.readline.chomp

          output.write("Case ##{index + 1}: ")

          transpose = board.transpose

          someone_won = (check_rows(board, output) || 
                         check_rows(transpose, output) ||
                         check_first_diagonal(board, output) ||
                         check_second_diagonal(board, output))

          unless someone_won
            draw = true
            board.each do |row|
              if row.include?(".")    
                output.write("Game has not completed")
                draw = false
                break
              end
            end
            output.write("Draw") if draw
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
problem.solve('A-small-practice.in')
problem.solve('A-large-practice.in')

