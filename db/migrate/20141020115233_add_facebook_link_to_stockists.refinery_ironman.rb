# This migration comes from refinery_ironman (originally 46)
class AddFacebookLinkToStockists < ActiveRecord::Migration
  def change
    add_column :refinery_ironman_stockists, :facebook_page, :string
  end
end
