class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :comments
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.references :rateable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
