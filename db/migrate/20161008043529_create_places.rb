class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :categories
      t.integer :miles
      t.timestamps
    end
  end
end
