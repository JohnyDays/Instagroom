class PostsController < ApplicationController
  before_filter :get_user
  def get_user
  if params[:username]
    @user = User.find_by_username(params[:username])
  else
    @user = User.find(params[:user_id])
  end
end

  def index
    @posts = @user.posts
    respond_to do |format|
      format.html
      format.json {render :json => @posts.to_json}
      format.xml { render :xml => @posts.to_xml }
    end
  end
end
