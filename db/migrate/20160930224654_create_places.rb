class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.float :lattitude
      t.float :longitude
      t.string :name
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
