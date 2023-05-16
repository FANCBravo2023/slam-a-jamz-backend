class AlterColumnName < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :date, :string
    rename_column :events, :date_time, :time
  end
end
