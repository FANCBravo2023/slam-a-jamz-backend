class EventsController < ApplicationController
  
  def index
    events = Event.all
    render json: events
  end
  
  def create
    # Create a new event
    event = Event.create(event_params)
    if event.valid?
      render json: event
    else 
      render json: event.errors, status:422
    end
  end
  
  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.valid?
      render json: event
    else
      render json: event.errors, status: 422
    end
  end
  
  def destroy
    event = Event.find(params[:id])
    if event.destroy
      render json: event
    else 
      render json: event.errors, status: 422
    end
  end

   # Handle strong parameters, so we are secure
  private
  def event_params
    params.require(:event).permit(:user_id, :date, :time, :venue, :street, :city, :state, :price)
  end
end
