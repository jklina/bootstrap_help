require 'spec_helper'

describe BootstrapHelp::ButtonHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::ButtonHelpers
    end
    HelpersClass.new
  end

  let(:options_hash) {{ class: "test" }}

  describe '#table_for' do
    it 'returns a bootstrap table for a given collection' do
      expected_result = "<div class=\"btn-toolbar\"><div class=\"btn-group\"><a class=\"btn\" href=\"/test\"><i class=\"icon-edit icon-black\"></i> </a><a class=\"btn\" href=\"/test-again\"><i class=\"icon-new icon-black\"></i> </a><a class=\"btn\" data-method=\"delete\" href=\"/test-again\" rel=\"nofollow\"><i class=\"icon-new icon-black\"></i> </a></div></div>"

      block = Proc.new {
        helpers.button "/test", icon: 'edit'
        helpers.button "/test-again", icon: 'new'
        helpers.button "/test-again", method: :delete, icon: 'new'
      }

      expect(helpers.button_toolbar(&block)).to eq(expected_result)
    end
  end

  describe '#button_to' do
    it "returns a primary button" do
      expect(helpers.primary_button_to('New Store', '#')).to eq("<a class=\"btn btn-primary\" href=\"#\">New Store</a>")
    end

    it "returns a primary button with an icon when specified" do
      expected_result = "<a class=\"btn btn-primary\" href=\"#\"><i class=\"icon-edit icon-white\"></i> New Store</a>"
      expect(helpers.primary_button_to('New Store', '#', icon: "edit",
                                                         icon_color: "white")).
        to eq(expected_result)
    end
  end
end
