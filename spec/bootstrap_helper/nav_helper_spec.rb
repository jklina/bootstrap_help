require 'spec_helper'


describe BootstrapHelpers::NavHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelpers::NavHelpers
    end
    HelpersClass.new
  end

  describe '#main_nav' do
    it 'accepts a brand' do
      expect(helpers.main_nav(brand: 'Brand')).to include('Brand')
    end

    it 'accepts a path for the brand to link to' do
      expect(helpers.main_nav(brand: 'Brand', brand_path: '/mypath')).
             to include('/mypath')
    end

    it 'accepts a block that can add content to the nav' do
      expect { |b| helpers.main_nav(brand: 'Brand', &b) }.to yield_control
    end
  end
end
