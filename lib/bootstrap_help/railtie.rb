module BootstrapHelp
  class Railtie < Rails::Railtie
    initializer "bootstrap_help.nav_helpers" do
      ActionView::Base.send :include, NavHelpers
      ActionView::Base.send :include, TableHelpers
    end
  end
end
