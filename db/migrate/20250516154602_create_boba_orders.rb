class CreateBobaOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :boba_orders do |t|
      t.string :flavor
      t.text :toppings
      t.string :size
      t.string :sugar
      t.string :ice

      t.timestamps
    end
  end
end
