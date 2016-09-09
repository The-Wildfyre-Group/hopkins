class ChangeSurveyBooleans < ActiveRecord::Migration
  def change
    remove_column :users, :survey_1
    remove_column :users, :survey_2
    remove_column :users, :survey_3
    remove_column :users, :survey_4
    remove_column :users, :survey_5
  end
end



