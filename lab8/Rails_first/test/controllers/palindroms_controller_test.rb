require "test_helper"

class PalindromsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindroms_input_url
    assert_response :success
  end

  test "should get show" do
    get palindroms_show_url
    assert_response :success
  end

  # test 'shoud return empty result if params is nil' do
  #   get palindroms_show_url, params: nil
  #   assert_equal(params[:n], [])
  # end

  # test 'shoud return empty result if params isn`t a numbers' do
  #   get palindroms_show_url, params: nil
  #   assert_equal(params[:n], [])
  # end
end
