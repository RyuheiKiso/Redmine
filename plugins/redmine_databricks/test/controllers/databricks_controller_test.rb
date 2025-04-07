require File.expand_path('../../test_helper', __FILE__)

class DatabricksControllerTest < ActionController::TestCase
  fixtures :issues, :users

  def setup
    @request.session[:user_id] = 1 # 管理者ユーザー
    @issue = issues(:one)
  end

  test 'should send ticket to Databricks' do
    post :send_to_databricks, params: { id: @issue.id }
    assert_response :redirect
    assert_not_nil flash[:notice]
  end

  test 'should handle Databricks job status' do
    get :job_status, params: { id: @issue.id }
    assert_response :success
  end
end