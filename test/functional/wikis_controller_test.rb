require File.dirname(__FILE__) + '/../test_helper'
require 'wikis_controller'

# Re-raise errors caught by the controller.
class WikisController; def rescue_action(e) raise e end; end

class WikisControllerTest < Test::Unit::TestCase
  fixtures :wikis

  def setup
    @controller = WikisController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:wikis)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_wiki
    old_count = Wiki.count
    post :create, :wiki => { }
    assert_equal old_count+1, Wiki.count
    
    assert_redirected_to wiki_path(assigns(:wiki))
  end

  def test_should_show_wiki
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_wiki
    put :update, :id => 1, :wiki => { }
    assert_redirected_to wiki_path(assigns(:wiki))
  end
  
  def test_should_destroy_wiki
    old_count = Wiki.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Wiki.count
    
    assert_redirected_to wikis_path
  end
end
