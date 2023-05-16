class Event < ApplicationRecord
  belongs_to :user
  validates :date, :time, :venue, :street, :city, :state, :price, presence:true
end
