class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        n = input.readline.chomp.to_i

        n.times do |i|
          s = input.readline.chomp.to_i

          queries = {}

          s.times do
            search_engine = input.readline.chomp
            queries[search_engine] = false
          end

          q = input.readline.chomp.to_i

          nb_unique_queries = 0

          nb_switches = 0

          q.times do
            search_engine = input.readline.chomp

            if !queries[search_engine]
              queries[search_engine] = true
              nb_unique_queries += 1
            end

            if nb_unique_queries == s
              nb_switches += 1

              queries.each_key { |q| queries[q] = false }
              queries[search_engine] = 1
              nb_unique_queries = 1
            end
          end

          output.write("Case ##{i + 1}: #{nb_switches}\n")
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

