class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.column :make, :string
      t.column :model, :string
      t.column :year, :string
      t.column :engine, :string
      t.column :category, :string
      t.column :color, :string
      t.column :gearbox, :string
      t.column :drivetrain, :string
      t.column :imageURL, :string
      t.column :videoURL, :string
      t.column :user_id, :integer

      t.timestamps
    end
    create_table :users do |t|
      t.column :name, :string
      t.timestamps
    end
    create_table :reviews do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :user_id, :integer
      t.column :bike_id, :integer, :default => 0
      t.column :track_id, :integer, :default => 0

      t.timestamps
    end
  end
end
