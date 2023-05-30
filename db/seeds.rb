user1 = User.where(email: "test1@example.com").first_or_create(
  encrypted_password: "password",
  password_confirmation: "password",
)


events = [
  {
    artist: "Aloe White",
    description: "Aloe white's music is characterized by its soulful and introspective lyrics, which touch on themes of love, loss, and self-discovery.",
    genre: "Up lifting",
    image:"https://tse4.mm.bing.net/th?id=OIP.MFBISLCjrOk8E-rIsekKPAHaE7&pid=Api&P=0&h=180",
    date: "May 21, 2023",
    time: "8pm",
    venue: "Pages Arena",
    street: "123 Croissant St",
    city: "Bakersfield",
    state: "CA",
    price: 94,
  },
  {
    artist: "DJ Kygo",
    description: "American",
    genre: "Dance Remixes",
    image:"https://tse2.mm.bing.net/th?id=OIP.XhD-4Uj2QJKpXeIbqPfEQAHaEK&pid=Api&P=0&h=180",
    date: "May 28, 2023",
    time: "11pm",
    venue: "Butcher Chop",
    street: "456 Baggette St",
    city: "Bismo Bich",
    state: "CA",
    price: 35,
  },
  {
    artist: "The Hamones",
    description: "The Hamones are a punk rock band from Los Angeles, California.",
    genre: "Punk",
    image:"https://tse4.mm.bing.net/th?id=OIP.PpbifZKO5IWxBm-6Sk4BOAHaEG&pid=Api&P=0&h=180",
    date: "May 30, 2023",
    time: "10pm",
    venue: "Skyway",
    street: "789 Wonder Bread Ln",
    city: "Maple Grove",
    state: "MN",
    price: 100,
  }
]

events.each do |event|
  user1.events.create event
  puts "creating event #{event}"
end


