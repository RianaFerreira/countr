class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.belongs_to :entitlement, index: true

      t.string :origin
      t.string :destination
      t.date   :entry_date
      t.date   :exit_date
      
      t.timestamps null: false
    end
  end
end
