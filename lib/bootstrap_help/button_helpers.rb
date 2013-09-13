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
            concat(draw_button(button[:icon_suffix], button[:options]))
          end
        end
      end
    end

    def button(icon_suffix, options)
      @buttons << {icon_suffix: icon_suffix, options: options}
      nil
    end

    private

    def draw_button(icon_suffix, options)
      link_to options, class: "btn" do
        content_tag :i, nil, class: "icon-#{icon_suffix}"
      end
    end
  end
end
