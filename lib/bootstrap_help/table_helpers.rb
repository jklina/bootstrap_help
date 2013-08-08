module BootstrapHelp
  module TableHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Context


    def table_for(collection)
      @columns = []
      content_tag :table, class: "table table-striped table-bordered" do
        yield
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
                concat(draw_column {
                  concat(item.send(c.fetch(:value)))
                })
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

    def draw_body
      content_tag(:tbody) { yield }
    end

    def draw_row
      content_tag(:tr) { yield }
    end

    def draw_column
      content_tag(:td) { yield }
    end


  end
end
