class ChangeIsActiveDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_active, from: false, to: 1
  end
end
