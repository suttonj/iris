class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :title
      t.text :summary

      t.timestamps
    end
  end
end
