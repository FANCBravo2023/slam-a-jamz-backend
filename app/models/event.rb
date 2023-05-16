class Event < ApplicationRecord
  belongs_to :user
  validates :artist, :description, :genre, :image, presence:true
end
