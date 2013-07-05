class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    unless @currentuser
    if cookies[:user_token]
      @currentuser = User.find_by_token(cookies[:user_token])
  end
end
  unless @currentuser
    redirect_to "/"
  end
end
  def authenticateOwnership(userid)
    authenticate
   if @currentuser.id != userid
     flash[:error] = "You do not have permission to acess this."
        redirect_to "root" # or wherever you want to redirect to
  end
end
end
