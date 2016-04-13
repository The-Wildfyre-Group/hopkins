module ApplicationHelper

  def twitter_share_link(share)
    link_to( image_tag('icons/twitter.png'),  "https://twitter.com/intent/tweet?status= #{share.message}", target: 'blank', class: "btn btn-primary")
  end

  def facebook_share_link(share)
    link_to( image_tag('icons/facebook.png'),  "http://www.facebook.com/sharer/sharer.php?u=#{share_url(share)}&summary=#{share.message}", target: 'blank', class: "btn btn-primary" )
  end

end
