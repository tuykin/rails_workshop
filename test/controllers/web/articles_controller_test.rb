require 'test_helper'

class WebArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_url
    assert_response :success
  end

  test 'should get article' do
    article = articles(:one)
    get article_url(article.id)
    assert_response :success
  end

  test 'should create article' do
    params = { title: 'title', text: 'some text' }
    post articles_url, params: { article: params }
    assert_redirected_to Article.last
  end

  test 'should update article' do
    article = articles(:one)
    params = { title: 'new title' }
    put article_url(article.id), params: { article: params }
    assert_redirected_to article
    assert_equal 'new title', article.reload.title
  end
end
