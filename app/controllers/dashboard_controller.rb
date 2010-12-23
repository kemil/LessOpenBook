class DashboardController < ApplicationController
  helper_method :determine_profile_picture
  
  def index
    @oauth_url = MiniFB.oauth_url(FB_APP_ID, HOST + "sessions/create", 
                                  :scope=>MiniFB.scopes.join(","))
    unless params[:q].blank?
      MiniFB.enable_logging
      
      #search users by status
      params[:url].blank? ? url = "http://graph.facebook.com/search?q=#{params[:q]}&type=post" : url = params[:url]
      @res = MiniFB.fetch(url)
      
      #save to user table
      unless @res["data"].blank?
      @res["data"].each do |r|
        user = User.find_by_fb_id(r['from']['id'])
        @user_info = MiniFB.get(@access_token, r['from']['id'])
        @profile = determine_profile_picture(@user_info, r)
        
        unless user
          create_user(@user_info, r)
        else
          update_user(@user_info, r, user)
        end
      end
        flash[:success] = "Users loaded."
      else
        flash[:error] = "Users not found."
      end
    end
  end
  
private

  def create_user(user_info, r)
    User.create(:name => user_info['name'],
                :fb_id => r['from']['id'],
                :profile_url => user_info['link'],
                :message => r['message'],
                :sex => user_info['gender'],
                :relationship_status => user_info['relationship_status'],
                :birthday => user_info['birthday'],
                :interested_in => user_info['interested_in'],
                :about => user_info['about'],
                :email => user_info['email'],
                :looking_for => user_info['meeting_for'],
                :hometown => user_info['hometown'].nil? ? '' : user_info['hometown']['name'],
                :current_city => user_info['location'],
                :religion => user_info['religion'],
                :thumb_url => @picture_url)
  end
  
  def update_user(user_info, r, user)
    user.update_attributes(:name => user_info['name'],
              :fb_id => r['from']['id'],
              :profile_url => user_info['link'],
              :message => r['message'],
              :sex => user_info['gender'],
              :relationship_status => user_info['relationship_status'],
              :birthday => user_info['birthday'],
              :interested_in => user_info['interested_in'],
              :about => user_info['about'],
              :email => user_info['email'],
              :looking_for => user_info['meeting_for'],
              :hometown => user_info['hometown'].nil? ? '' : user_info['hometown']['name'],
              :current_city => user_info['location'],
              :religion => user_info['religion'],
              :thumb_url => @picture_url)
  end
  
  def determine_profile_picture(user_info, r)
    if r['picture'].blank?
      user_info['gender'] == 'male' ? picture_url = 'http://b.static.ak.fbcdn.net/rsrc.php/yo/r/UlIqmHJn-SK.gif' : picture_url = 'http://static.ak.fbcdn.net/rsrc.php/y9/r/IB7NOFmPw2a.gif'
    else
      picture_url = r['picture']
    end
    
    return picture_url
  end
end