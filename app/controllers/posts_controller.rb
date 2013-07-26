class PostsController < ApplicationController
  before_filter :get_user, :except => :repost
  before_filter :authenticate
  def get_user
    if params[:username]
      @user = User.find_by_username params[:username].downcase
    else
      @user = User.find params[:user_id]
    end
  end

  def index
    @posts = @user.posts.order("created_at DESC")
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
    if(params[:file].size>0)
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
  def repost
    if(Post.find(params[:post]))
      post = Post.find(params[:post])
      newPost = Post.new
      newPost.content = post.content
      newPost.user_id = currentuser.id
      newPost.from_id = post.user_id
      newPost.source_id = post.source_id
      newPost.save
      File.open(Rails.root.join('public', 'uploads',post.user.username,post.id.to_s,"image"),"rb") do |file|
        Dir.mkdir(Rails.root.join('public', 'uploads',currentuser.username)) unless File.exists?(Rails.root.join('public', 'uploads',currentuser.username))
        Dir.mkdir(Rails.root.join('public', 'uploads',currentuser.username,newPost.id.to_s)) unless File.exists?(Rails.root.join('public', 'uploads',currentuser.username,newPost.id.to_s))
        File.open(Rails.root.join('public', 'uploads',currentuser.username,newPost.id.to_s,"image"),"wb") do |f|
          f.write(file.read)
        end
      end
    end
    redirect_to root_path
  end
  def destroy
    Post.find(params[:id]).delete
    flash[:error] = "Your post has been deleted"
    redirect_to user_posts_path(@user)
  end
end
