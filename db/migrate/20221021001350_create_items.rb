class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :not_tax_price, null: false
      t.boolean :is_active, null: false, default: 0
      t.timestamps
    end
  end
end
