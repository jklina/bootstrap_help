module BootstrapHelpers
  module NavHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context

    def main_nav(args)
      brand = args.fetch(:brand, '')
      brand_path = args.fetch(:brand_path, '/')

      content_tag :div, class: 'navbar navbar-fixed-top navbar-inverse' do
        content_tag :div, class: 'navbar-inner' do
          content_tag :div, class: 'container-fluid' do
            concat(responsive_menu_variation)
            concat(link_to(brand, brand_path, class: 'brand'))
            if block_given?
              concat(content_tag(:div, class: 'nav') { yield })
            end
          end
        end
      end
    end

    #Dropdown Menus
    def dropdown_menu(menu_name)

      content_tag :li, :class => "dropdown" do
        dropdown_link(menu_name) +
        content_tag(:ul, :class => "dropdown-menu") { yield }
      end
    end


    def dropdown_item(value, url)
      content_tag(:li, link_to(value, url))
    end

    def dropdown_divider
      content_tag(:li, nil, :class => "divider")
    end


    private

    def dropdown_link(value)
      content_tag :a, href: "#", class: "dropdown-toggle", "data-toggle" => "dropdown" do
        (value + content_tag(:b, nil, :class => "caret")).html_safe
      end
    end

    def responsive_menu_variation
      content_tag :button, :class => "btn btn-navbar", "data-toggle" => "collapse", "data-target" => ".nav-collapse" do
        content_tag(:span, nil, :class => "icon-bar") +
        content_tag(:span, nil, :class => "icon-bar") +
        content_tag(:span, nil, :class => "icon-bar")
      end
    end
  end
end
