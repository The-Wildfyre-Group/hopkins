class AddBooleansToUserForSpeed < ActiveRecord::Migration
  def change
    add_column :users, :survey_1, :boolean, default: false
    add_column :users, :survey_2, :boolean, default: false
    add_column :users, :survey_3, :boolean, default: false
    add_column :users, :survey_4, :boolean, default: false
    add_column :users, :survey_5, :boolean, default: false
    add_column :users, :eligible, :boolean, default: false
    
  end
end
