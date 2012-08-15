class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params[:comment])
    @comment.article = @article
    if @comment.save
      redirect_to @article, notice: "Comment Added"
    else
      render :new
    end
  end
end
