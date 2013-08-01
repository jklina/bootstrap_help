module BootstrapHelpers
  class Railtie < Rails::Railtie
    initializer "bootstrap_helpers.nav_helpers" do
      ActionView::Base.send :include, NavHelpers
    end
  end
end
