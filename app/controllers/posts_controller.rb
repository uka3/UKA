class PostsController < ApplicationController
  def index
    @posts = Post.all

  
 end
 def new
   @post = current_user.posts.build
   @post.build_movie# = Post.new(user_id: current_user.id)
 end

 def create
  @post = current_user.posts.build(post_attributes)
  if @post.save
    redirect_to posts_edit_path(@post)
  else
    render :new
  end
 end

 def show
  @post = Post.find(params[:id])
 end

 def edit
  @post = Post.find(params[:id])
 end

 def update
  @post = Post.find(params[:id])
  if @post.update_attributes(post_attributes)
    redirect_to posts_show_path(@post)
  else
    render :edit
  end
 end

 private
 def post_attributes
   params.require(:post).permit(post_params)
 end

 def post_params
   [
     :script, :title,
     movie_attributes: [
       :id,:video
     ]
   ]
 end
end
