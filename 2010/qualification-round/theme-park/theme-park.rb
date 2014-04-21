class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |i|
          line = input.readline.chomp.split
          nb_times  = line[0].to_i
          capacity  = line[1].to_i
          nb_groups = line[2].to_i

          #p nb_times
          #p capacity
          #p nb_groups

          groups_size = input.readline.chomp.split
          groups_size.map! { |size| size.to_i} 

          index = 0
          nb_euros = 0

          nb_people = groups_size.inject{ |sum, n| sum + n }

          if nb_people <= capacity
            nb_euros = nb_times * nb_people
          else
            nb_times.times do
              roller_coaster_load = 0

              new_load = roller_coaster_load + groups_size[index % nb_groups]
              while new_load <= capacity do
                roller_coaster_load = new_load
                index += 1
                new_load = roller_coaster_load + groups_size[index % nb_groups]
              end

              nb_euros += roller_coaster_load
            end
          end
          #p nb_euros
          output.write("Case ##{i + 1}: #{nb_euros}\n")
        end
        #
      
      end
    end
  end

end

problem = Problem.new

problem.solve('sample.in')
problem.solve('C-small-practice.in')
#problem.solve('C-large-practice.in')

