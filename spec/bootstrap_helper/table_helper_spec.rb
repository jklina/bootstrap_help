require 'spec_helper'

describe BootstrapHelp::TableHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::TableHelpers
    end
    HelpersClass.new
  end

  collection = []
  Customer = Struct.new(:name, :address)
  collection << Customer.new('Josh', '111')
  collection << Customer.new('Dave', '222')

  describe '#table_for' do
    it 'returns a bootstrap table for a given collection' do
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th></tr></thead><tbody><tr><td>JOSH</td><td>111</td></tr><tr><td>DAVE</td><td>222</td></tr></tbody></table>"

      block = Proc.new {
        helpers.column 'name' do |customer|
          customer.name.upcase
        end
        helpers.column 'address'
      }

      expect(helpers.table_for(collection, &block)).to eq(expected_result)
    end

    it "has the ability to add manageable links to the end of the table" do
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th><th>Any Old Name</th></tr></thead><tbody><tr><td>JOSH</td><td>111</td><td>hello</td></tr><tr><td>DAVE</td><td>222</td><td>hello</td></tr></tbody></table>"

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
  end
end
