  module Census
    extend ActiveSupport::Concern
    
    REGIONS = ["Northeast", "South", "Midwest", "West"]
    RANGE = [ [["18-34"],[18,34]], [["35-64"], [35,64]], [["65+"], [65]] ]
    EDUCATION = ["Less than High School", "High School/Some College", "Bachelor’s and Higher"]
  
    CENSUS_PARTICIPANTS = [18,24,11,23,23,11,63,84,13,67,93,14,11,24,3,8,22,3,70,85,39,9,9,3,214,289,35,38,52,8,29,70,9,6,17,3].sum
    
    CELLS = [ [18, 1.2], [63, 4.2], [11, 0.7], [70, 4.6], [214, 14.3], [29, 1.9], [24, 1.6], [84, 5.6], [24, 1.6], [85, 5.7], [289, 19.3], [70, 4.6], [11, 0.7], [13, 0.9], [3, 0.2], [39, 2.6], [35, 2.3], [9, 0.6], [23, 1.6], [67, 4.4], [8, 0.6], [9, 0.6], [38, 2.5], [6, 0.4], [23, 1.5], [93, 6.2], [22, 1.4], [9, 0.6], [52, 3.5], [17, 1.1], [11, 0.7], [14, 0.9], [3, 0.2], [3, 0.2], [8, 0.6], [3, 0.2]]
    
    # EDUCATION
    LESS_THAN_HIGHSCHOOL = [18,24,11,23,23,11,70,85,39,9,9,3].sum 
    HS_OR_SOME_COLLEGE = [63,84,13,67,93,14,214,289,35,38,52,8].sum
    COLLEGE_OR_MORE = [11,24,3,8,22,3,29,70,9,6,17,3].sum

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
      
      def vertical_position(i)
        return 1 if (0..5).to_a.include? i
        return 2 if (6..11).to_a.include? i
        return 3 if (12..17).to_a.include? i
        return 4 if (18..23).to_a.include? i
        return 5 if (24..29).to_a.include? i
        return 6 if (30..35).to_a.include? i
      end
      
      def horizontal_position(i)
        return 1 if (0..35).step(6).to_a.include? i
        return 2 if (1..35).step(6).to_a.include? i
        return 3 if (2..35).step(6).to_a.include? i
        return 4 if (3..35).step(6).to_a.include? i
        return 5 if (4..35).step(6).to_a.include? i
        return 6 if (5..35).step(6).to_a.include? i
      end
      
      def find_region(i)
        return "Northeast" if [0,1,2,6,7,8,12,13,14].include? i
        return "South" if [3,4,5,9,10,11,15,16,17].include? i
        return "Midwest" if [18,19,20,24,25,26,30,31,32].include? i
        return "West" if [21,22,23,27,28,29,33,34,35].include? i
      end
  
      def find_education(i)
        return "Less than High School" if ((0..35).step(6).to_a + (3..35).step(6).to_a).include? i
        return "High School/Some College" if ((1..35).step(6).to_a + (4..35).step(6).to_a).include? i
        return "Bachelor’s and Higher" if ((2..35).step(6).to_a + (5..35).step(6).to_a).include? i
      end

      def find_range(i)
        return [18,34] if [0,1,2,3,4,5,18,19,20,21,22,23].include? i
        return [35,64] if [6,7,8,9,10,11, 24,25,26,27,28,29].include? i
        return [65] if [12,13,14,15,16,17,30,31,32,33,34,35].include? i
      end

      
    end # end Class Methods
    

  
  
  
  
  
    # def self.calculate_proportions(region, education, age)
   #    User.where
   #
   #  end
    
    

  end

