module BootstrapHelp
  module ButtonHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context
    include BootstrapHelp::OptionHelpers

    BUTTON_OPTIONS = %i(icon icon_color)

    def button_toolbar(&block)
      @buttons = []
      block.call
      content_tag :div, class: "btn-toolbar" do
        content_tag :div, class: "btn-group" do
          @buttons.each do |button|
            concat(toolbar_button_to(nil, button[:url], button[:options]))
          end
        end
      end
    end

    def button(url=nil, options={})
      @buttons << { url: url, options: options }
      nil
    end

    def primary_button_to(name=nil, url=nil, options={})
      button_options = append_css_class("btn btn-primary", options)
      draw_button(name, url, button_options)
    end

    def toolbar_button_to(name=nil, url=nil, options={})
      button_options = append_css_class("btn", options)
      draw_button(nil, url, button_options)
    end

    private

    def draw_button(name=nil, url=nil, options={})
      icon_suffix = options[:icon]
      icon_color = options.fetch(:icon_color, "black")
      options.delete_if { |k, v| BUTTON_OPTIONS.include?(k) }
      link_to url, options do
        if icon_suffix.present?
          concat(content_tag :i, nil, class: "icon-#{icon_suffix} icon-#{icon_color}")
          name = " #{name}"
        end
        concat(name)
      end
    end
  end
end
