class DatabricksJob
  include ActiveModel::Model

  def initialize(api_key)
    @api_key = api_key
  end

  def send_ticket(ticket)
    # Databricks APIにチケット情報を送信するロジック
  end

  def fetch_status(job_id)
    # Databricksジョブのステータスを取得するロジック
  end
end