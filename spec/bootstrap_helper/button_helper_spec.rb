require 'spec_helper'

describe BootstrapHelp::ButtonHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::ButtonHelpers
    end
    HelpersClass.new
  end

  describe '#table_for' do
    it 'returns a bootstrap table for a given collection' do
      expected_result = "<div class=\"btn-toolbar\"><div class=\"btn-group\"><a class=\"btn\" href=\"/test\"><i class=\"icon-edit\"></i></a><a class=\"btn\" href=\"/test-again\"><i class=\"icon-new\"></i></a></div></div>"

      block = Proc.new {
        helpers.button 'edit', "/test"
        helpers.button 'new', "/test-again"
      }

      expect(helpers.button_toolbar(&block)).to eq(expected_result)
    end
  end
end
