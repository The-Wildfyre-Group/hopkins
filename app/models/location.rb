class Location
  
  def self.states
      [
        'Alabama', 'Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Florida',
        'Georgia','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine', 
        'Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire',
        'New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island',
        'South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming',
      ]
      # no hawaii, alaska
  end
  
  def self.west
    ['Arizona','California','Colorado', 'Idaho','Montana','Nevada','New Mexico','Oregon','Utah','Washington','Wyoming',]
  end
  
  def self.midwest
    ["Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", "Missouri", "Nebraska","North Dakota", "Ohio", "South Dakota","Wisconsin"]
  end
  
  def self.northeast
    ["Connecticut", "Maine", "Massachusetts", "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Rhode Island", "Vermont",]
  end
  
  def self.south
    ["Alabama", "Arkansas", "Delaware", "District of Columbia", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virginia", "West Virginia"]
  end
    
  def self.region(state)
    return "West" if self.west.include?(state)
    return "Midwest" if self.midwest.include?(state)
    return "Northeast" if self.northeast.include?(state)
    return "South" if self.south.include?(state)
    #Pacific: Hawaii, Alaska not included
  end
  
end