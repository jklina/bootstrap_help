module BootstrapHelpers
  module NavHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Context

    def main_nav(args)
      brand = args.fetch(:brand, '')
      brand_path = args.fetch(:brand_path, '/')

      content_tag :div, class: 'navbar navbar-fixed-top navbar-inverse' do
        content_tag :div, class: 'navbar-inner' do
          content_tag :div, class: 'container-fluid' do
            concat(responsive_menu_variation)
            concat(content_tag(:a, brand, href: brand_path, class: 'brand'))
            if block_given?
              concat(content_tag(:div, class: 'nav') { yield })
            end
          end
        end
      end
    end

    #Dropdown Menus
    def dropdown_menu(menu_name)
      @menu_links = []

      yield

      content_tag :li, :class => "dropdown" do
        dropdown_link(menu_name) + menu_body
      end
    end

    def dropdown_link(value)
      content_tag :a, :href => "#", :class => "dropdown-toggle", "data-toggle" => "dropdown" do
        (value + content_tag(:b, nil, :class => "caret")).html_safe
      end
    end

    def menu_body
      content_tag :ul, :class => "dropdown-menu" do
        @menu_links.each do |link|
          if link[:value].present?
            concat(content_tag(:li, link_to(link[:value], link[:url])))
          else
            concat(content_tag(:li, nil, :class => "divider"))
          end
        end
      end
    end

    def dropdown_item(value, url)
      @menu_links << { :value => value, :url => url }
      nil
    end

    def dropdown_divider
      @menu_links << { :value => nil, :url => nil }
      nil
    end

    # Responsive Variation
    def responsive_menu_variation
      content_tag :button, :class => "btn btn-navbar", "data-toggle" => "collapse", "data-target" => ".nav-collapse" do
        content_tag(:span, nil, :class => "icon-bar") +
        content_tag(:span, nil, :class => "icon-bar") +
        content_tag(:span, nil, :class => "icon-bar")
      end
    end

  end
end
