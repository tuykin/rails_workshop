class Web::Moderation::ArticlesController < Web::ApplicationController
  def index
    @articles = Article.with_state(:on_moderation)
  end

  def show
    @article = Article.with_state(:on_moderation).find(params[:id])
  end

  def moderate
    @article = Article.find(params[:id])
    @article.update(article_params)
    @article.moderate!

    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:category_id)
  end
end
