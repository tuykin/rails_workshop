class Web::Moderation::ArticlesController < Web::ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
    @articles = Article.with_state(:on_moderation) unless params[:q]
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
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
