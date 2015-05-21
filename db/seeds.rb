# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
jz = User.create(first_name: 'Johan', surname: 'Zietsman', email: 'johan.zietsman@gmail.com')
ri = User.create(first_name: 'Riana', surname: 'Ferreira', email: 'rianaferreira@gmail.com')

# Entitlements
e1 = Entitlement.create(name: 'Citizenship', description: nil, country: 'Australia', time_to_qualify: 4, user: jz)
e2 = Entitlement.create(name: 'Citizenship', description: nil, country: 'Australia', time_to_qualify: 4, user: ri)

# Riana Stay dates
riana_time_in_aus = [
  [Date.new(2011,3,30),  Date.new(2012,9,9)],
  [Date.new(2012,9,22),  Date.new(2012,10,5)],
  [Date.new(2012,11,2),  Date.new(2012,11,18)],
  [Date.new(2012,11,24), Date.new(2013,2,4)],
  [Date.new(2013,3,8),   Date.new(2014,1,24)],
  [Date.new(2014,1,27), nil]
]

riana_time_in_aus.each do |stay|
  Stay.create(entry_date: stay[0], exit_date: stay[1], entitlement: e2)
end

# Johan Stay dates
# [Date.new(2010,5,30), Date.new(2010,6,19)],
johan_time_in_aus = [
  [Date.new(2011,3,30), Date.new(2011,9,16)],
  [Date.new(2011,9,18), Date.new(2012,10,5)],
  [Date.new(2012,11,2), Date.new(2014,1,24)],
  [Date.new(2014,1,27), Date.new(2014,7,18)],
  [Date.new(2014,8,11), Date.new(2014,9,19)],
  [Date.new(2014,9,28), nil]
]

johan_time_in_aus.each do |stay|
  Stay.create(entry_date: stay[0], exit_date: stay[1], entitlement: e1)
end
