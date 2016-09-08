class CreateClaimedGiftcards < ActiveRecord::Migration
  def change
    create_table :claimed_giftcards do |t|
      t.belongs_to :user
      t.string :code

      t.timestamps
    end
  end
end
