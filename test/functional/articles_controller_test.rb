require File.dirname(__FILE__) + '/../test_helper'
require 'articles_controller'

# Re-raise errors caught by the controller.
class ArticlesController; def rescue_action(e) raise e end; end

class ArticlesControllerTest < Test::Unit::TestCase
  fixtures :articles

  def setup
    @controller = ArticlesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:articles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_article
    old_count = Article.count
    post :create, :article => { }
    assert_equal old_count+1, Article.count
    
    assert_redirected_to article_path(assigns(:article))
  end

  def test_should_show_article
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_article
    put :update, :id => 1, :article => { }
    assert_redirected_to article_path(assigns(:article))
  end
  
  def test_should_destroy_article
    old_count = Article.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Article.count
    
    assert_redirected_to articles_path
  end
end
