class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          n = input.readline.chomp.to_i

          v1 = input.readline.chomp.split.map { |x| x.to_i } 
          v2 = input.readline.chomp.split.map { |x| x.to_i } 

          v1.sort!
          v2.sort! { |x,y| y <=> x }
          
          min_scalar_product = 0

          n.times do |j|
            min_scalar_product += v1[j] * v2[j]
          end

          output.write("Case ##{i + 1}: #{min_scalar_product}\n")
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

