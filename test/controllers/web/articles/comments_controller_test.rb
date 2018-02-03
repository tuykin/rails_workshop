require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create comment' do
    article = articles(:one)
    params = { commentor: 'me', body: 'some text' }
    post article_comments_url(article.id), params: { article_comment: params }
    assert_redirected_to article
  end
end
