class CreateNewsHubs < ActiveRecord::Migration
  def change
    create_table :news_hubs do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
