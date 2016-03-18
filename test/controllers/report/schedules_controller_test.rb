require 'test_helper'

class Report::SchedulesControllerTest < ActionController::TestCase
  setup do
    @report_schedule = report_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_schedule" do
    assert_difference('Report::Schedule.count') do
      post :create, report_schedule: {  }
    end

    assert_redirected_to report_schedule_path(assigns(:report_schedule))
  end

  test "should show report_schedule" do
    get :show, id: @report_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_schedule
    assert_response :success
  end

  test "should update report_schedule" do
    patch :update, id: @report_schedule, report_schedule: {  }
    assert_redirected_to report_schedule_path(assigns(:report_schedule))
  end

  test "should destroy report_schedule" do
    assert_difference('Report::Schedule.count', -1) do
      delete :destroy, id: @report_schedule
    end

    assert_redirected_to report_schedules_path
  end
end
