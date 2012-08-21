class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  def correct_user
    @user = User.find(params[:user_id])
    unless @user == current_user
      flash[:error] = "You are not authorized to do this action"
      redirect_to root_path
    end
  end

end
