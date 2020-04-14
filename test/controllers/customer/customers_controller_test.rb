require 'test_helper'

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get cancel" do
    get customer_customers_cancel_url
    assert_response :success
  end

end
