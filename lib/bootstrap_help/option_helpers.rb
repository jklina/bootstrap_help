module BootstrapHelp
  module OptionHelpers
    def append_css_class(css_classes=nil, hash={})
      class_string = hash[:class] || ""
      if css_classes.present?
        class_string = class_string + " " + css_classes
      end
      hash[:class] = class_string.strip
      return hash
    end
  end
end
