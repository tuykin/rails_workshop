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

  test 'should create article draft' do
    category = article_categories(:sci_fi)
    params = { title: 'new article title', text: 'some text', category_id: category.id }
    post articles_url, params: { article: params }
    article = Article.find_by(title: params[:title])
    assert_response :redirect
    assert { category == article.category }
    assert { article.draft? }
  end

  test 'should update article' do
    article = articles(:one)
    params = { title: 'new title' }
    put article_url(article.id), params: { article: params }
    assert_response :redirect
    assert { params[:title] == article.reload.title }
  end

  test 'should destroy article' do
    article = articles(:one)
    delete article_url(article.id)
    assert_response :redirect
    assert_raises(ActiveRecord::RecordNotFound) { article.reload }
  end

  test 'should send to moderation' do
    article = articles(:one)
    patch send_to_moderation_article_path(article)
    assert_response :redirect
    assert { article.reload.on_moderation? }
  end
end
