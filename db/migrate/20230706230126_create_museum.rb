class CreateMuseum < ActiveRecord::Migration[7.0]
  def change
    create_table :museums do |t|
      t.string :name
      t.integer :number_of_galleries
      t.boolean :open_to_public

      t.timestamps
    end
  end
end
