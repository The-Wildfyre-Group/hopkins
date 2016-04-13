class CreateSharesTable < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :message
      t.string :photo
    end
  end
end
