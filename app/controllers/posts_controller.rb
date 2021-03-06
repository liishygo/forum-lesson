class PostsController < ApplicationController
  
  before_filter :find_post, :only => [ :show, :edit, :update, :destroy ]
  before_filter :find_forum, :only => [ :index, :new, :show, :edit ]
  before_filter :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy ]
  
  def index
    @posts = @forum.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.save
    
    redirect_to forum_path(@post.forum)
  end
  
  def show
    
  end
  
  def edit
    if current_user.id != @post.user_id
      redirect_to forum_path(@post.forum)
    end
  end
  
  def update
    @post.update_attributes(params[:post])
    
    redirect_to forum_path(@post.forum)
  end
  
  def destroy
    @post.destroy
    
    redirect_to forum_path(@post.forum)
  end
  
  protected
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
  
end
