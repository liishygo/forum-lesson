class PostsController < ApplicationController
  
  before_filter :find_post, :only => [ :show, :edit, :update, :destroy ]
  before_filter :find_forum, :only => [ :index, :new ]
  
  def index
    @posts = @forum.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.save
    
    redirect_to(:action => :index)
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    @post.update_attributes(params[:post])
    
    redirect_to(:action => :show, :id => @post)
  end
  
  def destroy
    @post.destroy
    
    redirect_to(:action => :index)
  end
  
  protected
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
  
end
