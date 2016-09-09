class SerializePassedSurveys < ActiveRecord::Migration
  def change
    add_column :users, :completed_surveys, :string, array: true, default: '{}'
  end
end
