module BootstrapHelp
  module ButtonHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context

    def button_toolbar(&block)
      @buttons = []
      block.call
      content_tag :div, class: "btn-toolbar" do
        content_tag :div, class: "btn-group" do
          @buttons.each do |button|
            concat(draw_button(*button))
          end
        end
      end
    end

    def button(*args)
      @buttons << args
      nil
    end

    private

    def draw_button(*args)
      icon_suffix = args.first
      options = args[1] || {}
      html_options = args[2] || {}
      html_options.merge!(class: "btn")
      link_to options, html_options do
        content_tag :i, nil, class: "icon-#{icon_suffix}"
      end
    end
  end
end
