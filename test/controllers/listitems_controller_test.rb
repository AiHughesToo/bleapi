require "test_helper"

class ListitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listitem = listitems(:one)
  end

  test "should get index" do
    get listitems_url, as: :json
    assert_response :success
  end

  test "should create listitem" do
    assert_difference('Listitem.count') do
      post listitems_url, params: { listitem: { item: @listitem.item, name: @listitem.name, snumber: @listitem.snumber } }, as: :json
    end

    assert_response 201
  end

  test "should show listitem" do
    get listitem_url(@listitem), as: :json
    assert_response :success
  end

  test "should update listitem" do
    patch listitem_url(@listitem), params: { listitem: { item: @listitem.item, name: @listitem.name, snumber: @listitem.snumber } }, as: :json
    assert_response 200
  end

  test "should destroy listitem" do
    assert_difference('Listitem.count', -1) do
      delete listitem_url(@listitem), as: :json
    end

    assert_response 204
  end
end
