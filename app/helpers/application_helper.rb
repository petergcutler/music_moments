module ApplicationHelper
  def embed(weburl)
    if weburl.include? "youtube.com"
      youtube_id = weburl.split("=").last
      content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    elsif weburl.include? "soundcloud.com"
      client = SoundCloud.new(:client_id => "76ebe5a5d650f447683103f01e00077c")
      track = client.get('/resolve', :url => weburl)
      @track_id = track.id
      content_tag(:iframe, nil, width:"100%", height:"450", scrolling:"no", frameborder:"no", src:"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{track.id}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true")
    end
end

  def signed_in
    !session[:user].nil?
  end

end
