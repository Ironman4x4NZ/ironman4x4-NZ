class RenameNotesToServicesForStockists < ActiveRecord::Migration
  def change
    rename_column :refinery_ironman_stockists, :notes, :services
    add_column :refinery_ironman_stockists, :notes, :string
  end
end
