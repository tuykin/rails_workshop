class Web::Articles::Comments::LikesController < Web::Articles::Comments::ApplicationController
  def create
    @like = resource_comment.likes.create
    redirect_to article_path(resource_article)
  end
end
