  module Partners
    extend ActiveSupport::Concern

    included do
    end
    
    module ClassMethods
      
      def partner_photo
        {"National Urban League"=>"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/NUL_logo.svg/600px-NUL_logo.svg.png",
         "Alpha Kappa Alpha"=>3, 
         "Omega Psi Phi Fraternity Inc."=>4, 
         "Concerned Black Men"=>5, 
         "The Root"=>3, 
         "Alpha Phi Alpha Fraternity Inc."=>4, 
         "The White House My Brother’s Keeper Initiative"=>3, 
         "NAACP"=>4, 
         "BET"=>1, 
         "National Medical Association"=>5, 
         "Rainbow PUSH Coalition"=>4, 
         "Zeta Phi Beta"=>1, 
         "Iota Phi Theta Fraternity Inc."=>3, 
         "Kappa Alphas Psi Fraternity Inc."=>"https://upload.wikimedia.org/wikipedia/en/4/48/KappaShield.png", 
         "National Council of Negro Women"=>3, 
         "Sigma Gamma Rho"=>4, 
         "Phi Beta Sigma Fraternity Inc."=>1, 
         "Radio One"=>3, 
         "Ebony Magazine"=>1, 
         "100 Black Men"=>2, 
         "TV One"=>"https://upload.wikimedia.org/wikipedia/en/9/99/TVOne_2016.png", 
         "Delta Sigma Theta"=>3}  
      end
      
    end # end Class Methods
    

    

  end



  