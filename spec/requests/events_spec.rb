require 'rails_helper'

  RSpec.describe 'Events', type: :request do
	  let(:user) { User.create(
      email: 'testing1@example.com', password: 'password', password_confirmation: 'password'
      )
    }
      describe "GET /index" do
        it 'gets a list of events' do
	        event = user.events.create(
          artist: "Your artist name",
          description: "Your artist description",
          genre: "Your genre",
          image: "url",
          date: "May 21, 2023",
          time: "8pm",
          venue: "Pages Arena",
          street: "123 Croissant St",
          city: "Bakersfield",
          state: "CA",
          price: 94
          )
      get "/events"

      events = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(events.length).to eq 1
    end
  end

      describe "POST /create" do
        it 'creates an event' do
          event_params = {
            event: {
              artist: "Your artist name",
              description: "Your artist description",
              genre: "Your genre",
              image: "url",
              date: "May 21, 2023",
              time: "8pm",
              venue: "Pages Arena",
              street: "123 Croissant St",
              city: "Bakersfield",
              state: "CA",
              price: 94,
              user_id: user.id
            }
          }
        post "/events", params: event_params

        expect(response).to have_http_status(200)

        event = Event.first

        expect(event.artist).to eq "Your artist name"
        expect(event.description).to eq "Your artist description"
        expect(event.genre).to eq "Your genre"
        expect(event.image).to eq "url"
        expect(event.date).to eq "May 21, 2023"
        expect(event.time).to eq "8pm"
        expect(event.venue).to eq "Pages Arena"
        expect(event.street).to eq "123 Croissant St"
        expect(event.city).to eq "Bakersfield"
        expect(event.state).to eq "CA"
        expect(event.price).to eq 94
      end
    end

      describe "PATCH /update" do
        it 'cannot update an event without all valid attributes' do
          event = user.events.create(
            artist: "Your artist name",
            description: "Your artist description",
            genre: "Your genre",
            image: "url",
            date: "May 21, 2023",
            time: "8pm",
            venue: "Pages Arena",
            street: "123 Croissant St",
            city: "Bakersfield",
            state: "CA",
            price: 94
          )
          event_params = {
            event: {
              artist: nil,
              description: nil,
              genre: nil,
              image: nil,
              date: nil,
              time: nil,
              venue: nil,
              street: nil,
              city: nil,
              state: nil,
              price: nil,
              user_id: user.id
            }
          }
        patch "/events/#{event.id}", params: event_params
        expect(response).to have_http_status(422)
        event = JSON.parse(response.body)
        expect(event["artist"]).to include "can't be blank"
        expect(event["description"]).to include "can't be blank"
        expect(event["genre"]).to include "can't be blank"
        expect(event["image"]).to include "can't be blank"
        expect(event["date"]).to include "can't be blank"
        expect(event["time"]).to include "can't be blank"
        expect(event["venue"]).to include "can't be blank"
        expect(event["street"]).to include "can't be blank"
        expect(event["city"]).to include "can't be blank"
        expect(event["state"]).to include "can't be blank"
        expect(event["price"]).to include "can't be blank"      
    end
  end

      describe "DELETE /destroy" do
        it 'will delete an event' do
          event = user.events.create(
            artist: "Your artist name",
            description: "Your artist description",
            genre: "Your genre",
            image: "url",
            date: "May 21, 2023",
            time: "8pm",
            venue: "Pages Arena",
            street: "123 Croissant St",
            city: "Bakersfield",
            state: "CA",
            price: 94
        )
      delete "/events/#{event.id}"
      expect(response).to have_http_status(200)
    end
  end
end

