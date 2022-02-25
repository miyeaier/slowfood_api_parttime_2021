class RemoveColumnCartIdFromProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :products, :cart_id
  end
end
