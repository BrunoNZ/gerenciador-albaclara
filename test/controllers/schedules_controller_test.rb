require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { address: @schedule.address, client_id: @schedule.client_id, contact_date: @schedule.contact_date, contact_name: @schedule.contact_name, contact_phone: @schedule.contact_phone, name: @schedule.name, observation: @schedule.observation, status: @schedule.status, visit_datetime: @schedule.visit_datetime }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    patch :update, id: @schedule, schedule: { address: @schedule.address, client_id: @schedule.client_id, contact_date: @schedule.contact_date, contact_name: @schedule.contact_name, contact_phone: @schedule.contact_phone, name: @schedule.name, observation: @schedule.observation, status: @schedule.status, visit_datetime: @schedule.visit_datetime }
    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
