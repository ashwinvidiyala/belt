class AddDateBoughtFieldToProduct < ActiveRecord::Migration
  def change
    add_column :products, :date_bought, :date
  end
end
