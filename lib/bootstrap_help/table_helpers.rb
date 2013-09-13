module BootstrapHelp
  module TableHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context

    def table_for(collection, args={}, &block)
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
      if column[:block].present?
       output = capture(item, &column[:block])
      else
        output = item.send(column.fetch(:value))
      end
      concat(draw_column { output })
    end
  end
end
