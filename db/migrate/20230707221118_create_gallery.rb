class CreateGallery < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :museum_id, index: true
      t.string :item_name
      t.integer :year
      t.boolean :on_loan

      t.timestamps
    end
  end
end
