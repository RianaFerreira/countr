class CreateEntitlements < ActiveRecord::Migration
  def change
    create_table :entitlements do |t|
      t.belongs_to :user, index: true
      
      t.string  :name
      t.text    :description
      t.string  :country
      t.integer :time_to_qualify

      t.timestamps null: false
    end
  end
end
