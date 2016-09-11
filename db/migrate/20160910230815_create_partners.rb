class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone
      t.string :email
      t.string :city
      t.string :state
      t.text :logo
    end
  end
end
