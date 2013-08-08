require 'spec_helper'

describe BootstrapHelp::TableHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::TableHelpers
    end
    HelpersClass.new
  end
  describe '#table_for' do
    it 'returns a bootstrap table for a given collection' do
      collection = []
      Customer = Struct.new(:name, :address)
      collection << Customer.new('Josh', '111')
      collection << Customer.new('Dave', '222')
      expected_result = "<table class=\"table table-striped table-bordered\"><thead><tr><th>Name</th><th>Address</th></tr></thead><tbody><tr><td>Josh</td><td>111</td></tr><tr><td>Dave</td><td>222</td></tr></tbody></table>"
      expect(
        helpers.table_for(collection) { 
          helpers.column 'name'; helpers.column 'address' }
      ).
        to eq(expected_result)
    end
  end
end
