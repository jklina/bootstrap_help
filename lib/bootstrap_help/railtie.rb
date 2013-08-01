module BootstrapHelp
  class Railtie < Rails::Railtie
    initializer "bootstrap_help.nav_helpers" do
      ActionView::Base.send :include, NavHelpers
    end
  end
end
