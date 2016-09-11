class JoinTableUserPartners < ActiveRecord::Migration
  def change
    create_table :partners_users do |t|
      t.integer :user_id
      t.integer :partner_id
    end

    add_index :partners_users, :user_id
    add_index :partners_users, :partner_id
  end
end
