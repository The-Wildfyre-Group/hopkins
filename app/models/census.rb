  module Census
    extend ActiveSupport::Concern
  
    CENSUS_PARTICIPANTS = [18,24,11,23,23,11,63,84,13,67,93,14,11,24,3,8,22,3,70,85,39,9,9,3,214,289,35,38,52,8,29,70,9,6,17,3].sum
  
    # EDUCATION
    LESS_THAN_HIGHSCHOOL = [18,24,11,23,23,11,70,85,39,9,9,3].sum 
    HS_OR_SOME_COLLEGE = [63,84,13,67,93,14,214,289,35,38,52,8].sum
    COLLEGE_OR_MORE = [11,24,3,8,22,3,29,70,9,6,17,3].sum

  
    #[18,24,11,23,23,11,63,84,13,67,93,14,11,24,3,8,22,3,70,85,39,9,9,9,214,289,35,38,52,8,29,70,9,6,17,3]

    included do
    end

    module ClassMethods
    
      def calculate_number(region, education, age_range)
        filtered_users = User.where(region: region, education: education)
        if age_range.size == 2
          filtered_users.select { |user| (age_range.first..age_range.last).to_a.include? user.age}.count
        elsif age_range.size == 1
          filtered_users.select { |user| user.age >= age_range.first}.count
        end
      end
      
      def calculate_proportion(region, education, age_range=[])
        number = calculate_number(region, education, age_range)
        users = User.all.count
        proportion = (number.to_f / users) * 100
      end
      
      def display(region, education, age_range=[])
        number = calculate_number(region, education, age_range)
        proportion = calculate_proportion(region, education, age_range)
        display = "#{proportion.round(1)}%(n=#{number})"
      end
  
    end # end Class Methods
  
  
  
  
  
    # def self.calculate_proportions(region, education, age)
   #    User.where
   #
   #  end
    
    

  end

