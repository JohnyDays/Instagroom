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
    respond_to do |format|
      format.html{redirect_to "/users/" << @user.id << "/posts"}
    end
  end
end
