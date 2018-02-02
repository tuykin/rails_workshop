require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_url
    assert_response :success
  end

  test 'should get article' do
    article = articles(:one)
    get articles_url, params: { id: article.id }
    assert_response :success
  end

  test 'should create article' do
    params = { title: 'title', text: 'some text' }
    post articles_url, params: { article: params }, headers: auth_headers
    assert_redirected_to Article.last
  end
end
