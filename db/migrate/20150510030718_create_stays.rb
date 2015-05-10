class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.integer :time_to_qualify
      t.date :entry_date
      t.date :exit_date
      t.timestamps null: false
    end
  end
end
