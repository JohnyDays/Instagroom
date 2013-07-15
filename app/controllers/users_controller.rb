class UsersController < ApplicationController
def index
  @currentuser = currentuser
end
def create
@user = User.new(params[:user])
@user.save
    respond_to do |format|
      format.html
      format.json{render @user.to_json}

    end

end

def login
    @user = User.find_by_username(params[:username])
    if  @user
      if @user.password == params[:password]
        cookies.permanent[:user_token] = @user.token if params[:remember]
        cookies[:user_token] = @user.token unless params[:remember]
        authenticate
      end
    end
    if @user
    redirect_to user_posts_path(@user)
    else
    flash[:error] = "Your username or password is wrong, sorry!"
    redirect_to users_path
  end
  end
def logout
    if @currentuser or cookies[:user_token]
    cookies.delete :user_token
    @currentuser = nil
  end
  flash[:success] = "You have been logged out"
  redirect_to users_path
end
end
