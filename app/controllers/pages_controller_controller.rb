
class PagesControllerController < ApplicationController
  def home
    def account 
    @oauth = Koala::Facebook::OAuth.new(FB_APP_ID, FB_APP_SECRET, 'http://192.168.1.50:3000/') 

    user_id = @oauth.get_user_from_cookies(cookies) # gets the user's ID 

    user_info = @oauth.get_user_info_from_cookies(cookies) # parses and returns the entire hash 

    access_token = user_info["access_token"] 
  
    # initialize a Graph API connection, for instance 
    @graph = Koala::Facebook::GraphAPI.new(oauth_access_token) 

    #Fetch user profile data 
    profile = @graph.get_object("me") 

    #Fetch user's friend list 
    friends = @graph.get_connections("me", "friends") 

    #Write into user's wall or friend feed 
    @graph.put_object("me", "feed", :message => "I am writing on my wall!") 

    end
  end
end
