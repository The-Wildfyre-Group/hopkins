class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :survey
      t.string :identifier
      t.string :group
      t.string :question

      t.timestamps
    end
  end
end
