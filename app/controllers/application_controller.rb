class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    if cookie[:user_token]
      User.find_by_token(cookies[:user_token])
  end
end
  def authenticateOwnership(userid)
    if cookie[:user_token]
     User.find_by_token(cookies[:user_token]).id == userid
  end
end
end
