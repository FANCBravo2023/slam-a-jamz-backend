class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :date_time
      t.string :venue
      t.string :street
      t.string :city
      t.string :state
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
