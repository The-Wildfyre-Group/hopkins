class ClaimGiftcard
  
  def self.call(user)
    code = ClaimGiftcard.first_available_giftcard
    user.create_claimed_giftcard(code: code) unless user.assigned_giftcard?
  end
  
  private
  
  def self.first_available_giftcard
    codes = AvailableCode.all - ClaimedGiftcard.all.pluck(:code)
    i = 0
    while ClaimedGiftcard.exists?(code: codes[i])
      i += 1
    end
    codes[i]
  end
  
end