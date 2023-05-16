require 'rails_helper'

  RSpec.describe 'Events', type: :request do
	  let(:user) { User.create(email: 'testing1@example.com', password: 'password', password_confirmation: 'password') }

      describe 'GET /index' do
        it 'gets a list of events' do
	        event = user.events.create(
          artist: 'Lady Nada',
          description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
	        genre: 'Pop',
          image: 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
          )
      # Make a request
      get '/events'

      events = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(events.first['artist']).to eq('Lady Nada')
    end
  end

      describe 'POST /create' do
        it 'creates an event' do
          # The params we are going to send with the request
          event_params = {
          event: {
            user_id: user.id,
            artist: 'Lady Nada',
	          description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the show's narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
	          genre: 'Pop',
            image: 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
          }
        }
      # Send the request to the server
      post '/events', params: event_params

      # Assure that we get a success back
      expect(response).to have_http_status(200)

      # Look up the event we expect to be created in the db
      event = Event.first

      # Assure that the created cat has the correct attributes
      expect(event.artist).to eq 'Lady Nada'
      expect(event.description).to eq "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the show's narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change."
      expect(event.genre).to eq 'Pop'
      expect(event.image).to eq 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
    end
  end

      describe 'PATCH /update' do
        it 'updates an event' do
          event = user.events.create(
            artist: 'Lady Nada',
	          description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
	          genre: 'Pop',
            image: 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
          )
        update_params = {
          event: {
            artist: 'Lady Nada',
	          description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted albums themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
	          genre: 'Pop',
            image: 'https://cdn.pixabay.com/photo/2017/01/16/21/47/pig-1985380_960_720.jpg'
          }
        }
      patch '/events/#{event.id}', params: update_params
      expect(response).to have_http_status(200)
      event = Event.first
      expect(event.artist).to eq 'Lady Nada'
      expect(event.description).to eq "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change."
      expect(event.genre).to eq 'Pop'
      expect(event.image).to eq 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
    end
  end

    describe 'DELETE /destroy' do
      it 'will delete an event' do
        event = Event.create(
          artist: 'Lady Nada',
          description: "It is Nada's first all- stadium concert tour and features a stage inspired by brutalist architecture. In line with the promoted album's themes, the shows narrative depicts a journey around trauma and healing. It is divided into distinct segments, each separated by a video introduction and a costume change.",
          genre: 'Pop',
          Image: 'https://live.staticflickr.com/7165/6587554335_f28b0a1951_c.jpg'
        )
      delete '/events/#{event.id}'
      expect(response).to have_http_status(200)
    end
  end
end

