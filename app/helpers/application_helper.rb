module ApplicationHelper
  
  def display(cell)
    display = "#{cell.last}%(n=#{cell.first})"
  end
  
  def region(cell)
    region = Cells.send("#{cell}_region")
  end
  
  def age_range(cell)
    range =  select_age_range(Cells.send("#{cell}_range"))
  end
  
  def site_number(cell)
    site = Cells.send("#{cell}_site").first
  end
  
  def census_number(cell)
    census = Cells.send(cell).first
  end
  
  def site_percent(cell)
    site = Cells.send("#{cell}_site").last
  end
  
  def census_percent(cell)
    census = Cells.send(cell).last
  end
  
  def education_(cell)
    education = Cells.send("#{cell}_education")
  end
  
  def number_difference(cell)
    census_number(cell) - site_number(cell)
  end
  
  def proportion_difference(cell)
     census_percent(cell) - site_percent(cell)
  end
  
  def number_comparison(cell)
    if number_difference(cell) > 0
      "We need #{number_difference(cell)} more participants aged #{age_range(cell)} in the #{region(cell)}, with #{education_(cell)} education."
    end
  end
  
  def percent_comparison(cell)
      "For participants aged #{age_range(cell)} in the #{region(cell)}, with #{education_(cell)} education, our survey is comprised of #{site_percent(cell)}% of this group compared to the census' #{census_percent(cell)}%."
  end
  
  def select_age_range(array)
    case array
    when [18,34]
      "18-34"
    when [35,64]
      "35-64"
    when [65]
      "65+"
    end
  end
  
end
