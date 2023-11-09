require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index action returns successful response' do
    get '/'
    assert_response :success
  end

  test 'index action renders correct template' do
    get '/'
    assert_template :index
  end

  test 'index action assigns website statuses' do
    get '/'
    assert assigns(:website_statuses).is_a?(Hash)
  end
end
