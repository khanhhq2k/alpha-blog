class CommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to article_path(@article)
    else
      flash[:danger] = "There is something wrong, please try again!"
      redirect_to article_path(@article)
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end