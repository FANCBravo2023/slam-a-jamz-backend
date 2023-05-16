require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:user) { User.create(email: 'testing1@example.com', password: 'password', password_confirmation: 'password') }
  it "should have a valid artist" do
    event = user.events.create(
      description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
      genre: "Pop",
      image: "https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg" 
    )
    expect(event.errors[:artist]).to include "can't be blank"
  end

  it "should have a valid description" do
    event = user.events.create(
      artist: "Lady Nada",
      genre: "Pop",
      image: "https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg" 
    )
    expect(event.errors[:description]).to include "can't be blank"
  end

  it "should have a valid genre" do
    event = user.events.create(
      artist: "Lady Nada",
      description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
      image: "https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg" 
    )
    expect(event.errors[:genre]).to include "can't be blank"
  end

  it "should have an image" do
    event = user.events.create(
      artist: "Lady Nada"
      description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
      genre: "Pop",
    )
    expect(event.errors[:image]).to include "can't be blank"
  end
end
