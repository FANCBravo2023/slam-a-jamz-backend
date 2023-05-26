user1 = User.where(email: "test1@example.com").first_or_create(
  encrypted_password: "password",
  password_confirmation: "password",
)


events = [
  {
    artist: "Your artist name",
    description: "Your artist description",
    genre: "Your genre",
    image:"url",
    date: "May 21, 2023",
    time: "8pm",
    venue: "Pages Arena",
    street: "123 Croissant St",
    city: "Bakersfield",
    state: "CA",
    price: 94
  },
  {
    artist: "Your artist name",
    description: "Your artist description",
    genre: "Your genre",
    image:"url",
    date: "May 28, 2023",
    time: "11pm",
    venue: "Butcher Chop",
    street: "456 Baggette St",
    city: "Bismo Bich",
    state: "CA",
    price: 35
  },
  {
    artist: "Your artist name",
    description: "Your artist description",
    genre: "Your genre",
    image:"url",
    date: "May 30, 2023",
    time: "10pm",
    venue: "Skyway",
    street: "789 Wonder Bread Ln",
    city: "Maple Grove",
    state: "MN",
    price: 100
  }
]

events.each do |event|
  user1.events.create (event)
  puts "creating: #{event}"
end


