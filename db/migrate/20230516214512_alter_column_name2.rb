class AlterColumnName2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :artist, :string
    add_column :users, :description, :string
    add_column :users, :genre, :string
    add_column :users, :image, :string
  end
end
