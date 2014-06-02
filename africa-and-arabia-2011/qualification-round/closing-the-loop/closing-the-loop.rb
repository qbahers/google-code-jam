class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        n = input.readline.chomp.to_i

        n.times do |index|
          s = input.readline.chomp.to_i
          segments = input.readline.chomp.split

          blue_segments = []
          red_segments  = []

          segments.each do |segment|
            if segment[-1] == "B"
              blue_segments << segment[0..-1].to_i
            else
              red_segments  << segment[0..-1].to_i
            end
          end

          blue_segments.sort! { |x, y| y <=> x }
          red_segments.sort!  { |x, y| y <=> x }

          nb_blue_segments = blue_segments.length
          nb_red_segments  = red_segments.length

          half_nb_segments_loop = [nb_blue_segments, nb_red_segments].min

          max_length_loop = 0

          (0..half_nb_segments_loop-1).each do |i|
            max_length_loop += blue_segments[i] + red_segments[i] - 2
          end

          output.write("Case ##{index + 1}: #{max_length_loop}\n")
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

