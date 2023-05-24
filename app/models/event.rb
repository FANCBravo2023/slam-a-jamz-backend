class Event < ApplicationRecord
  belongs_to :user
  validates :artist, :description, :genre, :image, :date, :time, :venue, :street, :city, :state, :price, presence:true
end
