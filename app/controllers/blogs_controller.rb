class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
    @comment = Comment.new
    @comments= @blog.comments.includes(:user)
  end

  def new
    @blog =  Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
    if @blog.user != current_user
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
   
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_path()
  end

  private
  
  def blog_params
    params.require(:blog).permit(:title, :contents)
  end
end