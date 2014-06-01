class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        t = input.readline.chomp.to_i

        t.times do |i|
          n = input.readline.chomp.to_i

          naomi_blocks = input.readline.chomp.split.map { |x| x.to_f } 
          ken_blocks   = input.readline.chomp.split.map { |x| x.to_f } 

          naomi_blocks.sort!
          ken_blocks.sort!

          ken_blocks_dw = ken_blocks.dup

          nb_points    = 0
          nb_points_dw = 0
          
          naomi_blocks.each do |naomi_block|
            heavier_block = ken_blocks.find { |ken_block| ken_block > naomi_block }
            
            if heavier_block
              ken_blocks.delete(heavier_block)
            else
              ken_blocks.shift
              nb_points += 1
            end
          end

          naomi_blocks.each do |naomi_block|
            if naomi_block < ken_blocks_dw.first
              ken_blocks_dw.pop
            else
              ken_blocks_dw.shift
              nb_points_dw += 1
            end
          end

          output.write("Case ##{i + 1}: #{nb_points_dw} #{nb_points}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('D-small-practice.in')
problem.solve('D-large-practice.in')

