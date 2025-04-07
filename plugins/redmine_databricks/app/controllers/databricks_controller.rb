# DatabricksController は Databricks との連携を担当します
class DatabricksController < ApplicationController
  # Databricks にチケット情報を送信するアクション
  def send_to_databricks
    # チケット ID を取得
    issue_id = params[:issue_id]

    # チケット情報を取得
    issue = Issue.find(issue_id)

    # Databricks API キーとエンドポイント URL を取得
    api_key = Rails.application.config_for(:settings)['databricks']['api_key']
    endpoint_url = Rails.application.config_for(:settings)['databricks']['endpoint_url']

    # Databricks API に送信するデータを準備
    payload = {
      issue_id: issue.id,
      subject: issue.subject,
      description: issue.description
    }

    # HTTP クライアントを使用して Databricks API にリクエストを送信
    response = HTTParty.post(
      endpoint_url,
      headers: { 'Authorization' => "Bearer #{api_key}", 'Content-Type' => 'application/json' },
      body: payload.to_json
    )

    # レスポンスを処理
    if response.success?
      # 処理結果をチケットの履歴に記録
      issue.journals.create!(notes: "Databricks に送信されました: #{response.body}")
      flash[:notice] = 'Databricks に送信しました。'
    else
      flash[:error] = 'Databricks への送信に失敗しました。'
    end

    # チケット画面にリダイレクト
    redirect_to issue_path(issue)
  end

  def job_status
    # Databricksジョブのステータスを取得するロジックを実装
  end

  private

  def find_issue
    @issue = Issue.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end