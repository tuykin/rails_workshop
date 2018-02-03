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
    category = article_categories(:sci_fi)
    params = { title: 'title', text: 'some text', category_id: category.id }
    post articles_url, params: { article: params }
    assert_redirected_to Article.last
    assert_equal category, Article.last.category
  end

  test 'should update article' do
    article = articles(:one)
    params = { title: 'new title' }
    put article_url(article.id), params: { article: params }
    assert_redirected_to article
    assert_equal 'new title', article.reload.title
  end

  test 'should destroy article' do
    article = articles(:one)
    delete article_url(article.id)
    assert_redirected_to articles_path
    assert_raises(ActiveRecord::RecordNotFound) { article.reload }
  end
end
