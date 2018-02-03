require 'test_helper'

class Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create comment' do
    article = articles(:one)
    params = { commentor: 'me', body: 'some text' }
    post article_comments_url(article.id), params: { article_comment: params }, headers: auth_headers
    assert_redirected_to article
  end
end
