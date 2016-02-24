class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # name
      t.string :first_name
      t.string :last_name
      
      # email
      t.string :email
      
      # location
      t.string :city
      t.string :state
      
      # password
      t.string :password_digest
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      
      # admin
      t.boolean :admin
      
      # education
      t.string :education
      
      # token
      t.string :authentication_token

      t.timestamps
    end
  end
end





  
  