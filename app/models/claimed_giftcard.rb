class ClaimedGiftcard < ActiveRecord::Base
  belongs_to :user
  
end


# after survey completion
# send a code to a user
# first, check to see that code has already been sent
# also, check to see if that user and/or email has received an giftcard

