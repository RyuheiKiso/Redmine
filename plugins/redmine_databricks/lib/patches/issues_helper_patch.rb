module RedmineDatabricks
  module IssuesHelperPatch
    def self.included(base)
      base.class_eval do
        # IssuesHelperのshow_detailメソッドを拡張
        def render_custom_button(issue)
          link_to 'Custom Button', '#', class: 'custom-button'
        end
      end
    end
  end
end