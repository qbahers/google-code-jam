class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        line = input.readline.chomp.split.map {|x| x.to_i }
        l = line[0]
        d = line[1]
        n = line[2]

        known_words = []

        d.times do
          word = input.readline.chomp
          known_words << word
        end

        n.times do |i|
          pattern = input.readline.chomp

          pattern.gsub!('(', '[')
          pattern.gsub!(')', ']')

          regex = Regexp.new(pattern)

          nb_words = known_words.count { |word| regex =~ word }

          output.write("Case ##{i + 1}: #{nb_words}\n")
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

