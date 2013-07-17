class FollowsController < ApplicationController
before_filter :get_user
def get_user
@user = User.find(params[:following_id])
end
def create
  if isUserFollowing(@user)
  flash[:error] = "You are already following " + @user.username + "."
  redirect_to user_posts_path(@user)
else
  @follow = currentuser.follows.new
  @follow.following_id = params[:following_id]
  @follow.save
  flash[:success] = "You have followed " + @user.username + "."
  redirect_to user_posts_path(@user)
end
end
def destroy
 if isUserFollowing(@user)
  @follow = currentuser.follows.find_by_following_id(@user.id)
  @follow.destroy
  flash[:success] = "You are no longer following " + @user.username + "."
  redirect_to user_posts_path(@user)
else
  flash[:success] = "You were not following" + @user.username + "you dummy."
  redirect_to user_posts_path(@user)
end
end
end
