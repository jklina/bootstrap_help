require 'spec_helper'

describe BootstrapHelp::OptionHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::OptionHelpers
    end
    HelpersClass.new
  end

  let(:options_hash) {{ class: "test" }}

  describe '#append_css_class' do
    it "appends classes to the class value in a hash" do
      new_hash = helpers.append_css_class("btn primary", options_hash)
      expect(new_hash[:class]).to eq("test btn primary")
    end

    it "returns the same class value if there's nothing to append" do
      new_hash = helpers.append_css_class(nil, options_hash)
      expect(new_hash[:class]).to eq(options_hash[:class])
    end

    it "returns the same class value if an empty string is appended" do
      new_hash = helpers.append_css_class("", options_hash)
      expect(new_hash[:class]).to eq(options_hash[:class])
    end

    it "returns a hash with appended values if there is no hash submitted" do
      new_hash = helpers.append_css_class("test")
      expect(new_hash[:class]).to eq("test")
    end
  end
end
