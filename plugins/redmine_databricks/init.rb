# Redmineプラグインの登録
Redmine::Plugin.register :redmine_databricks do
  name 'Redmine Databricks plugin' # プラグイン名
  author 'Author name' # 作者名
  description 'This is a plugin for Redmine' # プラグインの説明
  version '0.0.1' # バージョン
  url 'http://example.com/path/to/plugin' # プラグインのURL
  author_url 'http://example.com/about' # 作者のURL
end

# IssuesHelperにパッチを適用
Rails.configuration.to_prepare do
  IssuesHelper.include RedmineDatabricks::IssuesHelperPatch
end

# アセットのプリコンパイル設定
Rails.application.config.assets.precompile += %w(custom_modal.js index.js)
