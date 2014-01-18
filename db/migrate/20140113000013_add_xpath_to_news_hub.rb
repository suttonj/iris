class AddXpathToNewsHub < ActiveRecord::Migration
  def change
    add_column :news_hubs, :xpath, :string
  end
end
