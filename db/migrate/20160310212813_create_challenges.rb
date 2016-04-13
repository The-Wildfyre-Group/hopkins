class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :position
      t.string :title
      t.text :challenge
      t.string :purpose

      t.timestamps
    end
  end
end
