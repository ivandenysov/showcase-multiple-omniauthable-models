class Managers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @manager = Manager.from_omniauth(request.env["omniauth.auth"])

    if @manager.persisted?
      sign_in_and_redirect @manager, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
