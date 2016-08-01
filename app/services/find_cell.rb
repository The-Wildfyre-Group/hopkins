class FindCell
  
  def self.call(region, education, range)
    region_cells = FindCell.regional_cell(region)
    education_cells = FindCell.education_cell(education)
    range_cells = FindCell.range_cell(range)
    region_cells & education_cells & range_cells
  end
  
  private
  
  def self.regional_cell(region)
    return [0,1,2,6,7,8,12,13,14] if region == "Northeast"
    return [3,4,5,9,10,11,15,16,17] if region == "South" 
    return [18,19,20,24,25,26,30,31,32] if region == "Midwest"
    return [21,22,23,27,28,29,33,34,35] if region == "West"
  end
  
  def self.education_cell(education)
    return ((0..35).step(6).to_a + (3..35).step(6).to_a) if education == "Less than High School" 
    return ((1..35).step(6).to_a + (4..35).step(6).to_a) if education == "High School/Some College"
    return ((2..35).step(6).to_a + (5..35).step(6).to_a) if education == "Bachelor’s and Higher"
  end
  
  def self.range_cell(range)
    return [0,1,2,3,4,5,18,19,20,21,22,23] if range == [18,34] 
    return [6,7,8,9,10,11, 24,25,26,27,28,29] if range == [35,64]
    return [12,13,14,15,16,17,30,31,32,33,34,35] if range == [65]
  end
  
  
end