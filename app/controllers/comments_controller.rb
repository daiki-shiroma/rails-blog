class CommentsController < ApplicationController

    def show
      @comment = Comment.find_by(id: params[:id])
      @blog = @comment.blog 
    end
    
    
    def new
      @blog = Blog.find_by(params[:id])
      @comment = @blog.comments.new
    end

    def create 
      comment = Comment.create(comment_params2)
      redirect_to blog_path(comment.blog.id)
    end


    def destroy
      @comment  = Comment.find_by(id: params[:id])
      @comment.destroy
      redirect_to blogs_path()
    end
    
  
    private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def comment_params2
      params.require(:comment).permit(:content).merge(user_id: current_user.id, blog_id: params[:blog_id])
    end
  end
  