class Problem
  
  def solve(dataset)
    File.open(dataset, 'r') do |input|
      File.open(dataset.sub(/\.in/, '.out'), 'w') do |output|
      
        #
        n = input.readline.chomp.to_i

        n.times do |i|
          m = input.readline.chomp.to_i

          prices = input.readline.chomp.split.map { |x| x.to_i }

          buying_month  = -1
          selling_month = -1

          best_profit = 0
          
          lowest_price_per_unit = -1

          (0..10).each do |j|
            nb_items_bought = m / prices[j]
            remaining_money = m % prices[j]

            unless nb_items_bought == 0
              buying_price   = prices[j]
              selling_price  = prices[j+1..-1].max

              profit = nb_items_bought * (selling_price - buying_price) 
                       + remaining_money

              price_per_unit = prices[j]

              if profit > best_profit || 
                 (profit == best_profit && price_per_unit < lowest_price_per_unit )

                buying_month  = j + 1
                selling_month = prices.index(selling_price) + 1

                best_profit = profit

                lowest_price_per_unit = price_per_unit
              end
            end
          end
          
          output.write("Case ##{i+ 1}: ")

          if best_profit > 0
            result = "#{buying_month} #{selling_month} #{best_profit}"
          else
            result = "IMPOSSIBLE"
          end

          output.write("#{result}\n")
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

