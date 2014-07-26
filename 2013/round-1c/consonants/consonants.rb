class Problem
  
  def has_n_consecutive_consonants?(substring, length, n)
    nb_consecutive_consonants = 0

    vowels = ['a', 'e', 'i', 'o', 'u']

    (0..length - 1).each do |i|
      if !(vowels.include? substring[i])
        nb_consecutive_consonants += 1 
        return true if nb_consecutive_consonants >= n
      else
        nb_consecutive_consonants = 0
      end
    end

    return false
  end

  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        (1..t).each do |case_number|
          output.write("Case ##{case_number}: ")

          line = input.readline.chomp.split
          name = line[0]
          l    = name.length
          n    = line[1].to_i

          n_value = 0

          (0..l - 1).each do |i|
            (0..l - 1).each do |j|
              substring = name[i..j]
              length = j - i + 1

              if has_n_consecutive_consonants?(substring, length, n)
                n_value += 1 
              end
            end
          end

          output.write("#{n_value}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('A-small-practice.in')
#problem.solve('-large-practice.in')

