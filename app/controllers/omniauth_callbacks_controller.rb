class OmniauthCallbacksController < ApplicationController
  def index
  end

  def twitter
    # You need to implement the method below in your model
    @user = TwitterAuth.find_for_twitter_auth_oauth(env["omniauth.auth"], nil)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "TwitterAuth"
      sign_in_and_redirect @user, :event => :authentication

    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to root_path #new_user_registration_url
    end
  end
end
