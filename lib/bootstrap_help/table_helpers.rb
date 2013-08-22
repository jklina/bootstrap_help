module BootstrapHelp
  module TableHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context

    def table_for(collection, &block)
      @columns = []
      block.call
      content_tag :table, class: "table table-striped table-bordered" do
        thead + tbody(collection)
      end
    end

    def column(name, value = nil, sortable = true, &block)
      value = name unless value
      @columns << {:name => name, :value => value, :sortable => sortable, :block => block}
      nil
    end

    private

    def tbody(collection)
      draw_body do
          collection.each do |item|
            concat(draw_row {
              @columns.each do |c|
                parse_column(c, item)
              end
            })
          end
      end
    end

    def thead
      content_tag :thead do
        draw_row do
          @columns.each do |c|
            concat(content_tag(:th, c.fetch(:name).to_s.titleize))
          end
        end
      end
    end

    def draw_body(&block)
      content_tag(:tbody, &block)
    end

    def draw_row(&block)
      content_tag(:tr, &block)
    end

    def draw_column(&block)
      content_tag(:td, &block)
    end

    def parse_column(column, item)
      attribute = item.send(column.fetch(:value))
      if column[:block].present?
        output = column[:block].call(attribute)
      else
        output = attribute
      end
      concat(draw_column { concat(output) })
    end
  end
end
