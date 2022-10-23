class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :member, null: false
      t.references :item, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
