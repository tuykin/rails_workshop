class Web::Moderation::Articles::ApplicationController < Web::ApplicationController
  protect_from_forgery with: :exception

  def resource_article
    requested_article || Article.new
  end

  def requested_article
    Article.find(params[:article_id])
  end
end
