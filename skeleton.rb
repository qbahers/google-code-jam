class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #

        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
#problem.solve('-small-practice.in')
#problem.solve('-large-practice.in')

