require 'test_helper'

class QuizResultsControllerTest < ActionController::TestCase
  setup do
    @quiz_result = quiz_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_result" do
    assert_difference('QuizResult.count') do
      post :create, quiz_result: { answers: @quiz_result.answers, email: @quiz_result.email, quiz_id: @quiz_result.quiz_id, scores: @quiz_result.scores }
    end

    assert_redirected_to quiz_result_path(assigns(:quiz_result))
  end

  test "should show quiz_result" do
    get :show, id: @quiz_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_result
    assert_response :success
  end

  test "should update quiz_result" do
    patch :update, id: @quiz_result, quiz_result: { answers: @quiz_result.answers, email: @quiz_result.email, quiz_id: @quiz_result.quiz_id, scores: @quiz_result.scores }
    assert_redirected_to quiz_result_path(assigns(:quiz_result))
  end

  test "should destroy quiz_result" do
    assert_difference('QuizResult.count', -1) do
      delete :destroy, id: @quiz_result
    end

    assert_redirected_to quiz_results_path
  end
end
