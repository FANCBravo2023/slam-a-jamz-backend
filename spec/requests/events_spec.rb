require 'rails_helper'

  RSpec.describe 'Events', type: :request do
	  let(:user) { User.create(
      email: 'testing1@example.com', password: 'password', password_confirmation: 'password'
      )
    }
      describe "GET /index" do
        it 'gets a list of events' do
	        event = user.events.create(
          date: "May 28, 2023",
          time: "9pm",
          venue: "Pages Arena",
          street: "123 Croissant St",
          city: "Bakersfield",
          state: "CA",
          price: 94
          )
      # Make a request
      get "/events"

      events = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(events.length).to eq 1
    end
  end

      describe "POST /create" do
        it 'creates an event' do
          # The params we are going to send with the request
          event_params = {
            event: {
              date: "May 28, 2023",
              time: "9pm",
              venue: "Pages Arena",
              street: "123 Croissant St",
              city: "Bakersfield",
              state: "CA",
              price: 94,
              user_id: user.id
            }
          }
        # Send the request to the server
        post "/events", params: event_params

        # Assure that we get a success back
        expect(response).to have_http_status(200)

        # Look up the event we expect to be created in the db
        event = Event.first

        # Assure that the created cat has the correct attributes
        expect(event.date).to eq "May 28, 2023"
        expect(event.time).to eq "9pm"
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
            date: "May 28, 2023",
            time: "9pm",
            venue: "Pages Arena",
            street: "123 Croissant St",
            city: "Bakersfield",
            state: "CA",
            price: 94
          )
          event_params = {
            event: {
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
            date: "May 28, 2023",
            time: "9pm",
            venue: "Pages Arena",
            street: "123 Croissant St",
            city: "Bakersfield",
            state: "CA",
            price: 94,
        )
      delete "/events/#{event.id}"
      expect(response).to have_http_status(200)
    end
  end
end

