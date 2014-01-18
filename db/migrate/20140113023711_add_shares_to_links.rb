class AddSharesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :shares, :integer
  end
end
