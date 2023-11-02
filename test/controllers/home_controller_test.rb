require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index action returns successful response' do
    get '/'
    assert_response :success
  end

  test 'index action assigns website statuses' do
    get '/'
    assert assigns(:website_statuses).is_a?(Hash)
  end

  test 'index action assigns correct status codes for websites' do
    websites = [
      { name: '메인', url: 'https://uos.ac.kr' },
      { name: '와이즈', url: 'https://wise.uos.ac.kr' },
    # Add more websites as needed
    ]

    get '/'

    # Replace the following line with your actual website status code checks
    # Example: assert_equal 200, assigns(:website_statuses)['메인']
  end
end
