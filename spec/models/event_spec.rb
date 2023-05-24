require 'rails_helper'

RSpec.describe 'Event', type: :request do
  let(:user) { User.create(email: 'testing1@example.com', password: 'password', password_confirmation: 'password') }

  it "should have a valid artist" do
    event = user.events.create(
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:artist]).to include "can't be blank"
  end

  it "should have a valid description" do
    event = user.events.create(
      artist: "Your artist name",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:description]).to include "can't be blank"
  end

  it "should have a valid genre" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:genre]).to include "can't be blank"
  end

  it "should have a valid image" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:image]).to include "can't be blank"
  end
  
  it "should have a valid date" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:date]).to include "can't be blank"
  end

  it "should have a valid time" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:time]).to include "can't be blank"
  end

  it "should have a valid venue" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:venue]).to include "can't be blank"
  end

  it "should have a valid street" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      city: "Bakeresfield",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:street]).to include "can't be blank"
  end

  it "should have a valid city" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      state: "CA",
      price: 94,
    )
    expect(event.errors[:city]).to include "can't be blank"
  end

  it "should have a valid state" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      price: 94,
    )
    expect(event.errors[:state]).to include "can't be blank"
  end

  it "should have a valid price" do
    event = user.events.create(
      artist: "Your artist name",
      description: "Your artist description",
      genre: "Your genre",
      image: "url",
      date: "May 21, 2023",
      time: "8pm",
      venue: "Pages Arena",
      street: "123 Croissant St",
      city: "Bakeresfield",
      state: "CA",
    )
    expect(event.errors[:price]).to include "can't be blank"
  end

end
