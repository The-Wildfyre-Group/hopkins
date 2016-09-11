  module Partners
    extend ActiveSupport::Concern
    included do
    end
    
    module ClassMethods
      
      def partner_photo
        {"National Urban League"=>"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/NUL_logo.svg/600px-NUL_logo.svg.png",
         "Alpha Kappa Alpha"=>"https://upload.wikimedia.org/wikipedia/en/1/13/AKAshield2.png",
         "Omega Psi Phi Fraternity Inc."=>"https://upload.wikimedia.org/wikipedia/en/b/b7/Omegashield.png",
         "Concerned Black Men"=>"https://pbs.twimg.com/profile_images/454688702883954689/Bq4MaIQI.jpeg",
         "The Root"=>"https://upload.wikimedia.org/wikipedia/commons/c/c1/The_Root_%28logo%29.png",
         "Alpha Phi Alpha Fraternity Inc."=>"http://www.apa1906.net/websites/alphaphialpha/images/branding/apa_crest_132_c.png",
         "The White House My Brother’s Keeper Initiative"=>"https://www.whitehouse.gov/sites/default/files/image/MBK/my_brothers_keeper_lockup_new.jpg",
         "NAACP"=>"https://upload.wikimedia.org/wikipedia/en/1/17/NAACP_logo_2010.png",
         "BET"=>"http://www.freelogovectors.net/wp-content/uploads/2012/04/bet-logo.jpg",
         "National Medical Association"=>"http://c.ymcdn.com/sites/www.nmanet.org/graphics/logo.jpg",
         "Rainbow PUSH Coalition"=>"http://www.rainbowpush.org/page/-/images/logo.gif",
         "Zeta Phi Beta"=>"https://upload.wikimedia.org/wikipedia/en/f/f3/ZetaPhiBeta.jpg",
         "Iota Phi Theta Fraternity Inc."=>"https://upload.wikimedia.org/wikipedia/en/4/4c/IotaPhiTheta.jpg",
         "Kappa Alphas Psi Fraternity Inc."=>"https://upload.wikimedia.org/wikipedia/en/4/48/KappaShield.png",
         "National Council of Negro Women"=>"http://ncnw.org/images/newheader_r1_c1.jpg",
         "Sigma Gamma Rho"=>"https://upload.wikimedia.org/wikipedia/en/a/a7/SigmaGammaRhoshield.jpg",
         "Phi Beta Sigma Fraternity Inc."=>"https://upload.wikimedia.org/wikipedia/en/6/61/Phi_Beta_Sigma_crest.png",
         "Radio One"=>"https://upload.wikimedia.org/wikipedia/en/3/35/Radio_one_logo.png",
         "Ebony Magazine"=>"https://mgtvwcbd.files.wordpress.com/2016/02/ap_07110703322.png?w=650",
         "100 Black Men"=>"https://upload.wikimedia.org/wikipedia/commons/c/cb/100BlackMenAmericaLogo.jpg",
         "TV One"=>"https://upload.wikimedia.org/wikipedia/en/9/99/TVOne_2016.png",
         "Delta Sigma Theta"=>"https://upload.wikimedia.org/wikipedia/en/thumb/d/de/DeltaSigmaTheta.svg/133px-DeltaSigmaTheta.svg.png"}
      end
      
    end # end Class Methods

  end



  