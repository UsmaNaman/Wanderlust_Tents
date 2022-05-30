class CreateTents < ActiveRecord::Migration[7.0]
  def change
    create_table :tents do |t|
      t.string :title
      t.text :description
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.float :price

      t.timestamps
    end
  end
end
