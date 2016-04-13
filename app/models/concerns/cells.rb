  module Cells
    extend ActiveSupport::Concern

    included do
    end
    
    module ClassMethods
      
      def cell_names
        [:cell_h1v1, :cell_h2v1, :cell_h3v1, :cell_h4v1, :cell_h5v1, :cell_h6v1,
         :cell_h1v2, :cell_h2v2, :cell_h3v2, :cell_h4v2, :cell_h5v2, :cell_h6v2,
         :cell_h1v3, :cell_h2v3, :cell_h3v3, :cell_h4v3, :cell_h5v3, :cell_h6v3,
         :cell_h1v4, :cell_h2v4, :cell_h3v4, :cell_h4v4, :cell_h5v4, :cell_h6v4,
         :cell_h1v5, :cell_h2v5, :cell_h3v5, :cell_h4v5, :cell_h5v5, :cell_h6v5,
         :cell_h1v6, :cell_h2v6, :cell_h3v6, :cell_h4v6, :cell_h5v6, :cell_h6v6,]
      end
      
    end # end Class Methods
    
    
    
    (0..35).each do |i|
      
      define_singleton_method "cell_h#{User.horizontal_position(i)}v#{User.vertical_position(i)}_site" do
        r = User.find_region(i)
        e = User.find_education(i)
        age = User.find_range(i)
         [User.calculate_number(r, e, age), User.calculate_proportion(r, e, age).round(1)]
      end
      
      define_singleton_method "cell_h#{User.horizontal_position(i)}v#{User.vertical_position(i)}_region" do
        r = User.find_region(i)
      end
      
      define_singleton_method "cell_h#{User.horizontal_position(i)}v#{User.vertical_position(i)}_education" do
        r = User.find_education(i)
      end
      
      define_singleton_method "cell_h#{User.horizontal_position(i)}v#{User.vertical_position(i)}_range" do
        r = User.find_range(i)
      end
      
    end

    
    User::CELLS.each_with_index do |cell, i|
  
      define_singleton_method "cell_h#{User.horizontal_position(i)}v#{User.vertical_position(i)}" do
        cell
      end
    
    end  
    

  end



  