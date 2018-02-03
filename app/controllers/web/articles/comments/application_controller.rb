class Web::Articles::Comments::ApplicationController < Web::Articles::ApplicationController
  protect_from_forgery with: :exception

  def resource_comment
    requested_comment || resource_article.comments.new
  end

  def requested_comment
    resource_article.comments.find(params[:comment_id])
  end
end
