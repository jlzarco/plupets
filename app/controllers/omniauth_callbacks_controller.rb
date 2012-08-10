class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  #def twitter
    #omniauth = request.env["omniauth.auth"]
    #authentication = Authorization.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    #if authentication #if the authentication exists
      #flash[:notice] = "Signed in successfully!"
      #sign_in_and_redirect(:user, authentication.user)
    #elsif current_user #user exists but there's no authentication of this type
      #current_user.authorizations.create!(provider: omniauth['provider'], uid: omniauth['uid'])
      #flash[:notice] = "Authentication successful"
      #redirect_to root_path
    #else # new user
      #user = User.new
      #user.apply_omniauth(omniauth)
      #if user.save
        #flash[:notice] = "Signed in successfully!"
        #sign_in_and_redirect(:user, user)
      #else
        #session[:omniauth] = omniauth.except('extra')
        #redirect_to new_user_registration_url
      #end
      #redirect_to new_user_registration_url, notice: "Please make an account first"
    #end
  #end

  def facebook
    #raise request.env["omniauth.auth"].to_yaml
    omniauth = request.env["omniauth.auth"]
    user_with_email = User.find_by_email(omniauth['info']['email'])
    authentication = Authorization.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication #if the authentication exists
      flash[:notice] = "Signed in successfully!"
      sign_in_and_redirect(:user, authentication.user)
    elsif user_with_email #user exists but there's no authentication of this type
      user_with_email.authorizations.create!(provider: omniauth['provider'], uid: omniauth['uid'])
      flash[:notice] = "Authentication successful"
      sign_in_and_redirect(:user, user_with_email)
    else # new user
      #user = User.new(email: omniauth['info']['email'])
      #user.apply_omniauth(omniauth)
      #if user.save
        #flash[:notice] = "Signed in successfully!"
        #sign_in_and_redirect(:user, user)
      #else
        #session[:omniauth] = omniauth.except('extra')
        #redirect_to new_user_registration_url
      #end
      session['devise.user_email'] = omniauth['info']['email']
      redirect_to new_user_registration_url, alert: "Please make an account first"
    end
  end

end
