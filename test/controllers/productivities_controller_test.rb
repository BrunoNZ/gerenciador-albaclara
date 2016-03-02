require 'test_helper'

class ProductivitiesControllerTest < ActionController::TestCase
  setup do
    @productivity = productivities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productivities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productivity" do
    assert_difference('Productivity.count') do
      post :create, productivity: { analysis_end_date: @productivity.analysis_end_date, analysis_start_date: @productivity.analysis_start_date, answered_call_qty: @productivity.answered_call_qty, call_qty: @productivity.call_qty, client_id: @productivity.client_id, interlocutor_qty: @productivity.interlocutor_qty, schedule_qty: @productivity.schedule_qty }
    end

    assert_redirected_to productivity_path(assigns(:productivity))
  end

  test "should show productivity" do
    get :show, id: @productivity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productivity
    assert_response :success
  end

  test "should update productivity" do
    patch :update, id: @productivity, productivity: { analysis_end_date: @productivity.analysis_end_date, analysis_start_date: @productivity.analysis_start_date, answered_call_qty: @productivity.answered_call_qty, call_qty: @productivity.call_qty, client_id: @productivity.client_id, interlocutor_qty: @productivity.interlocutor_qty, schedule_qty: @productivity.schedule_qty }
    assert_redirected_to productivity_path(assigns(:productivity))
  end

  test "should destroy productivity" do
    assert_difference('Productivity.count', -1) do
      delete :destroy, id: @productivity
    end

    assert_redirected_to productivities_path
  end
end
