require 'test_helper'

class Web::Articles::Comments::LikesControllerTest < ActionDispatch::IntegrationTest
  test 'should create like' do
    comment = article_comments(:one)
    post article_comment_likes_url(comment.article.id, comment.id)
    assert_response :redirect
    assert { 1 == comment.likes.count }
  end
end
