require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, service: { category: @service.category, description: @service.description, due_date: @service.due_date, price: @service.price, refund: @service.refund, status: @service.status, sub_category: @service.sub_category, title: @service.title, title_seo: @service.title_seo, youtube_url: @service.youtube_url }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update service" do
    patch :update, id: @service, service: { category: @service.category, description: @service.description, due_date: @service.due_date, price: @service.price, refund: @service.refund, status: @service.status, sub_category: @service.sub_category, title: @service.title, title_seo: @service.title_seo, youtube_url: @service.youtube_url }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
