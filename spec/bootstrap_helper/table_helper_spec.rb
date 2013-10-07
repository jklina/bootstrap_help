require 'spec_helper'

describe BootstrapHelp::TableHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::TableHelpers
    end
    HelpersClass.new
  end

  collection = []
  Customer = Struct.new(:name, :address, :good?, :bad?, :not_right?, :informative?)
  collection << Customer.new('Josh', '111', true, true, true, true)
  collection << Customer.new('Dave', '222', true, true, true, true)

  describe '#table_for' do
    it 'returns a bootstrap table for a given collection' do
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th></tr></thead><tbody><tr class=\"\"><td>JOSH</td><td>111</td></tr><tr class=\"\"><td>DAVE</td><td>222</td></tr></tbody></table>"

      block = Proc.new {
        helpers.column 'name' do |customer|
          customer.name.upcase
        end
        helpers.column 'address'
      }

      expect(helpers.table_for(collection, &block)).to eq(expected_result)
    end

    it "has the ability to add manageable links to the end of the table" do
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th><th>Any Old Name</th></tr></thead><tbody><tr class=\"\"><td>JOSH</td><td>111</td><td>hello</td></tr><tr class=\"\"><td>DAVE</td><td>222</td><td>hello</td></tr></tbody></table>"

      block = Proc.new {
        helpers.column 'name' do |customer|
          customer.name.upcase
        end
        helpers.column 'address'
        helpers.column 'Any Old Name' do |customer|
          "hello"
        end
      }

      expect(helpers.table_for(collection, &block)).to eq(expected_result)

    end

    it "well let you assign classes to rows based off item methods" do
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th></tr></thead><tbody><tr class=\"success error warning info\"><td>JOSH</td><td>111</td></tr><tr class=\"success error warning info\"><td>DAVE</td><td>222</td></tr></tbody></table>"

      block = Proc.new {
        helpers.column 'name' do |customer|
          customer.name.upcase
        end
        helpers.column 'address'
      }

      row_class_map = {
        success: :good?,
        error: :bad?,
        warning: :not_right?,
        info: :informative?
      }

      expect(helpers.table_for(collection, row_decorators: row_class_map, &block)).to eq(expected_result)

    end
  end
end
