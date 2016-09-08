class AddElgibilityFactorsToUser < ActiveRecord::Migration
  def change
    add_column :users, :race, :string
    add_column :users, :sex,  :string
    add_column :users, :desire, :boolean
  end
end
