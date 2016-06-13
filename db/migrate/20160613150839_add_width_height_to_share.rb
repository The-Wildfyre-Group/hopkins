class AddWidthHeightToShare < ActiveRecord::Migration
  def change
    add_column :shares, :width, :integer
    add_column :shares, :height, :integer
  end
end
