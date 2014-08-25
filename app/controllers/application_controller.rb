class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD

  def after_sign_in_path_for(user)
  	user_path(current_user)
  end
=======
>>>>>>> 308804e6755a0a63405544464ae667dcfaca2470
end
