# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# Databricks プラグイン用のルートを設定
Rails.application.routes.draw do
  # チケット情報を Databricks に送信するルート
  post 'databricks/send_to_databricks', to: 'databricks#send_to_databricks', as: 'send_to_databricks'
end
