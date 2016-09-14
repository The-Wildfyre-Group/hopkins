class AddApprovedToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :approved, :boolean, default: false
  end
end
