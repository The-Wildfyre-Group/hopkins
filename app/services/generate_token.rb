class GenerateToken
  
  def self.call(object, column)
    GenerateToken.generate_token_for_existing_object(object, column) if object.persisted?
    GenerateToken.generate_token_for_new_object(object, column) if object.new_record?
  end
  
  private
  
  def self.generate_token_for_existing_object(object, column)
    begin
      object.update_attributes(column => SecureRandom.urlsafe_base64)
    end while object.class.where(column => object[column]).count > 1
  end
  
  def self.generate_token_for_new_object(object, column)
    begin
      object[column] = SecureRandom.urlsafe_base64
    end while object.class.exists?(column => object[column])
  end
  
  
end