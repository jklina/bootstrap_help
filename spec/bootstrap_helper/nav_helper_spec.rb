require 'spec_helper'


describe BootstrapHelp::NavHelpers do
  let(:helpers) do
    class HelpersClass
      include BootstrapHelp::NavHelpers
    end
    HelpersClass.new
  end
  let(:block) { Proc.new { 'block content' } }

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

    it 'returns a bootstrap top nav bar' do
      result = "<div class=\"navbar navbar-fixed-top navbar-inverse\"><div class=\"navbar-inner\"><div class=\"container-fluid\"><button class=\"btn btn-navbar\" data-target=\".nav-collapse\" data-toggle=\"collapse\"><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"brand\" href=\"/\">Brand</a>block content</div></div></div>"
      expect(helpers.main_nav(brand: 'Brand', &block)).to eq(result)
    end
  end

  describe '#left' do
    it 'returns html that wraps items on the left side of the nav' do
      result = "<div class=\"nav\">block content</div>"
      expect(helpers.left(&block)).to eq(result)
    end
  end

  describe '#right' do
    it 'returns html that wraps items on the right side of the nav' do
      result = "<div class=\"nav pull-right\">block content</div>"
      expect(helpers.right(&block)).to eq(result)
    end
  end

  describe '#dropdown_menu' do
    it 'returns a bootstrap dropdown menu with the provided name' do
      result = "<li class=\"dropdown\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">test<b class=\"caret\"></b></a><ul class=\"dropdown-menu\">block content</ul></li>"
      expect(helpers.dropdown_menu('test', &block)).to eq(result)
    end
  end

  describe '#menu_link_to' do
    it 'returns a bootstrap menu link with the provided value and url' do
      result = "<li><a href=\"#\">test</a></li>"
      expect(helpers.menu_link_to('test', '#')).to eq(result)
    end
  end

  describe '#dropdown_divider' do
    it 'returns a bootstrap dropdown menu divider' do
      result = "<li class=\"divider\"></li>"
      expect(helpers.dropdown_divider).to eq(result)
    end
  end

  describe '#left' do
    it 'returns markup to align links to the left' do
      result = "<li class=\"divider\"></li>"
      expect(helpers.dropdown_divider).to eq(result)
    end
  end
end
