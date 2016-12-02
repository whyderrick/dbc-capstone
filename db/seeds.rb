# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


addresses = [
  "2639 E.9th St, Oakland, CA",
  "633 Folsom St, San Francisco, CA",
  "Pier 3, San Francisco, CA",
  "1002 36th St, Oakland, CA",
  "85 2nd St, San Francisco, CA",
  "469 Tehama St, San Francisco, CA",
  "650 Howard St, San Francisco, CA",
  "115 New Montgomery, San Francisco, CA",
  "100 Bush St, San Francisco, CA"
]
username = ['whyderrick', 'julesmartin', 'darrenlee', 'longtran']
users = [
  { username: username[0],
    email: "whyderrick@outlook.com",
    password: username[0]
  },
  {
    username: username[1],
    email: "julesmartin76000@gmail.com",
    password: username[1]
  },
  { username: username[2],
    email: "darren804@gmail.com",
    password: username[2]
  },
  { username: username[3],
    email: "longtran415@gmail.com",
    password: username[3]
  }
]

g1 = Group.create(
  name: "Bay Safety Net",
  location: "San Francisco, CA",
  description: "We get the job done."
)
g2 = Group.create(
  name: "Robbie's Crew",
  location: "San Francisco, CA",
  description: "Safety First. Story Second."
)


users.each do |u|
  created_user = User.create(u)

  3.times do |n|
    w = Walk.new(
      starting_location: addresses.sample,
      requester_id: created_user.id,
      destination: addresses.sample,
      walk_time: DateTime.now + "2.#{n}".to_f
    )

    while w.starting_location == w.destination
      w.destination = addresses.sample
    end
    
    w.save
  end
  created_user.groups << [g1, g2].sample
end
