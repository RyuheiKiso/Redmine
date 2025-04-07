require 'net/http'
require 'json'

class DatabricksClient
  BASE_URL = 'https://<your-databricks-instance>.cloud.databricks.com/api/2.0'

  def initialize(api_key)
    @api_key = api_key
  end

  def send_ticket_data(ticket_data)
    uri = URI("#{BASE_URL}/jobs/runs/submit")
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{@api_key}"
    request['Content-Type'] = 'application/json'
    request.body = ticket_data.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    JSON.parse(response.body)
  end

  def get_job_result(run_id)
    uri = URI("#{BASE_URL}/jobs/runs/get?run_id=#{run_id}")
    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{@api_key}"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    JSON.parse(response.body)
  end
end