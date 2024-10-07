class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article, notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to @article, alert: 'Le commentaire ne peut pas être vide.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
