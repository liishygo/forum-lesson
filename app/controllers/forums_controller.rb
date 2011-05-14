class ForumsController < ApplicationController
  
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy ]
  before_filter :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy ]
  
  def index
    @forums = Forum.all
  end
  
  def new
    if current_user.id != 1
      redirect_to forums_path
    end
    @forum = Forum.new
  end
  
  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      flash[:notice] = "forum was successfully created."
      redirect_to forums_url
    else
      render :action => :new
    end
  end
  
  def show
    @posts = @forum.posts
  end
  
  def edit
    if current_user.id != 1
      redirect_to forums_path
    end
  end
  
  def update
    @forum.update_attributes(params[:forum])
    flash[:notice] = "froum was successfully update."
    
    redirect_to forum_url(@forum)
  end
  
  def destroy
    @forum.destroy
    flash[:alert] = "forum was successfully deleted."
    redirect_to forums_url
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  end
  
end
