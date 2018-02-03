class Web::Moderation::ArticlesController < Web::ApplicationController
  def index
    default_ransack_params = { state_eq: 'on_moderation' }
    @q = Article.ransack(params[:q] || default_ransack_params)

    @articles = @q.result(distinct: true)
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
