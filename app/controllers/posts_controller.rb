class PostsController < ApplicationController
  before_filter :get_user, :authenticate
  def get_user
  if params[:username]
    @user = User.find_by_username params[:username]
  else
    @user = User.find params[:user_id]
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
  def new
    @post = Post.new
    @post.user_id = @user.id
  end
  def create
    @post = Post.new(params[:post])
    @post.user_id = currentuser.id
    @post.source_id = currentuser.id
    @post.save
    @uploaded_io = params[:file]
    Dir.mkdir(Rails.root.join('public', 'uploads',currentuser.username)) unless File.exists?(Rails.root.join('public', 'uploads',currentuser.username))
    Dir.mkdir(Rails.root.join('public', 'uploads',currentuser.username,@post.id.to_s))
    File.open(Rails.root.join('public', 'uploads',currentuser.username,@post.id.to_s,"image"),"wb") do |file|
    file.write(@uploaded_io.read)
  end
  end
end
