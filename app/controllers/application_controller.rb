class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticateOwnership, :isUserFollowing, :isUserFollower
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
def currentuser
 User.find_by_token(cookies[:user_token])
end
def authenticateOwnership(userid)
   if currentuser.id != userid
     return false
  end
  return true
end
def isUserFollowing(user)
  if currentuser.followings.include? user
    return true
  else
    return false
  end
end
def isUserFollower(user)
if user.followings.include? currentuser
  return true
else
  return false
end
end
end
