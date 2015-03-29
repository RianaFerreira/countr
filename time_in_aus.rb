require 'Date'

time_in_aus = [
                [Date.new(2011,3,30), Date.new(2012,9,9)],
                [Date.new(2012,9,22), Date.new(2012,10,5)],
                [Date.new(2012,11,2), Date.new(2012,11,18)],
                [Date.new(2012,11,24), Date.new(2013,2,4)],
                [Date.new(2013,3,8), Date.new(2014,1,24)],
                [Date.new(2014,1,27), Date.today]
              ]

total_time_in_aus = 0

time_in_aus.each do |stay|
  arrival = stay[0]
  departure = stay[1]
  total_time_in_aus += (departure - arrival).to_i
end

days_to_citizenship_application = (total_time_in_aus % 365)

p "Total days spent in Australia to date: #{total_time_in_aus}"
p "Total weeks spent in Australia to date: #{total_time_in_aus / 7}"
p "Total years spent in Australia to date: #{total_time_in_aus / 365}"

p "Days to citizenship application #{(365 - days_to_citizenship_application)}"
p "Weeks to citizenship application #{52 - (days_to_citizenship_application / 7)}"
p "Months to citizenship application #{12 - (days_to_citizenship_application / 30)}"
