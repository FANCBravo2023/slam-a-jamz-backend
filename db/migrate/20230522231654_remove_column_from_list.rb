class RemoveColumnFromList < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :artist
    remove_column :users, :description
    remove_column :users, :genre
    remove_column :users, :image
    add_column :events, :artist, :string
    add_column :events, :description, :string
    add_column :events, :genre, :string
    add_column :events, :image, :text
  end
end
