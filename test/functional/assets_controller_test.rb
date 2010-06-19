require File.dirname(__FILE__) + '/../test_helper'
require 'assets_controller'

# Re-raise errors caught by the controller.
class AssetsController; def rescue_action(e) raise e end; end

class AssetsControllerTest < Test::Unit::TestCase
  fixtures :assets

  def setup
    @controller = AssetsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:assets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_asset
    old_count = Asset.count
    post :create, :asset => { }
    assert_equal old_count+1, Asset.count
    
    assert_redirected_to asset_path(assigns(:asset))
  end

  def test_should_show_asset
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_asset
    put :update, :id => 1, :asset => { }
    assert_redirected_to asset_path(assigns(:asset))
  end
  
  def test_should_destroy_asset
    old_count = Asset.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Asset.count
    
    assert_redirected_to assets_path
  end
end
