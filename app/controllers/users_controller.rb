class UsersController < ApplicationController

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
        cookies[:user_token] = @user.token
      end
    end
    if @user
    redirect_to user_posts_path(@user)
    else
    flash[:error] = "Your username or password is wrong, sorry!"
    redirect_to users_path
  end
  end
end
