class ClaimGiftcard
  
  def self.call(user)
    code = ClaimGiftcard.first_available_giftcard
    ClaimedGiftcard.create(user_id: user.id, code: code) unless user.assigned_giftcard?
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