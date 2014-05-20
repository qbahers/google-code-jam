class Problem

  def get_nb_vehicles(employees, seats)
    taken_seats = 0
    nb_cars = seats.size
    i = 0

    while (i < nb_cars) && (taken_seats < employees)
      taken_seats += seats[i]
      i += 1
    end

    (taken_seats < employees) ? -1 : i
  end

  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|

        #
        nb_test_cases = input.readline.chomp.to_i

        nb_test_cases.times do |index|
          line = input.readline.chomp.split.map { |c| c.to_i }

          nb_towns = line.first
          town     = line.last

          nb_employees = input.readline.chomp.to_i

          employees = Array.new(nb_towns + 1, 0)
          seats = []
          (nb_towns + 1).times { seats << [] }

          nb_employees.times do
            line = input.readline.chomp.split.map { |c| c.to_i }

            home_town      = line.first
            nb_passengers  = line.last

            employees[home_town] += 1

            if (nb_passengers > 0)
              seats[home_town] << nb_passengers
            end
          end

          seats.map do |e|
            e.sort! { |x, y| y <=> x }
          end

          vehicles = []
          (1..nb_towns).each do |t|
            if (t == town)
              nb_vehicles = 0
            else
              nb_vehicles = get_nb_vehicles(employees[t], seats[t])
            end

            if (nb_vehicles == -1)
              vehicles = nil
              break
            else
              vehicles << nb_vehicles
            end
          end

          output.write("Case ##{index + 1}: ")
          if vehicles
            output.write("#{vehicles.join(" ")}")
          else
            output.write("IMPOSSIBLE")
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
problem.solve('B-small-practice.in')
problem.solve('B-large-practice.in')
