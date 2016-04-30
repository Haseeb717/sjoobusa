require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, feedback: { commitment_score: @feedback.commitment_score, company_id: @feedback.company_id, contribution_to_sales: @feedback.contribution_to_sales, customer_service_score: @feedback.customer_service_score, employee_id: @feedback.employee_id, end_at: @feedback.end_at, excellence_score: @feedback.excellence_score, flexibility_score: @feedback.flexibility_score, late_for_work: @feedback.late_for_work, leadership_score: @feedback.leadership_score, proactivity_score: @feedback.proactivity_score, productivity_score: @feedback.productivity_score, role: @feedback.role, service_type: @feedback.service_type, start_at: @feedback.start_at, teamwork_score: @feedback.teamwork_score, unjustified_absences: @feedback.unjustified_absences, warnings: @feedback.warnings }
    end

    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should show feedback" do
    get :show, id: @feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback
    assert_response :success
  end

  test "should update feedback" do
    patch :update, id: @feedback, feedback: { commitment_score: @feedback.commitment_score, company_id: @feedback.company_id, contribution_to_sales: @feedback.contribution_to_sales, customer_service_score: @feedback.customer_service_score, employee_id: @feedback.employee_id, end_at: @feedback.end_at, excellence_score: @feedback.excellence_score, flexibility_score: @feedback.flexibility_score, late_for_work: @feedback.late_for_work, leadership_score: @feedback.leadership_score, proactivity_score: @feedback.proactivity_score, productivity_score: @feedback.productivity_score, role: @feedback.role, service_type: @feedback.service_type, start_at: @feedback.start_at, teamwork_score: @feedback.teamwork_score, unjustified_absences: @feedback.unjustified_absences, warnings: @feedback.warnings }
    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should destroy feedback" do
    assert_difference('Feedback.count', -1) do
      delete :destroy, id: @feedback
    end

    assert_redirected_to feedbacks_path
  end
end
