# BootstrapHelp

Bootstrap Help is a collection of Rails Helper methods that help build Bootstrap's HTML components.

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap_help'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap_help

## Usage

### Nav Helper

The Nav Helper helps you quickly build a fixed navigation bar in Bootstrap. For example:

```haml
= main_nav(brand: "My Awesome Company") do
  = left do
    = dropdown_menu "My Menu" do
      = menu_link_to "Link1", "#"
      = menu_link_to "Link2", "#"
      = menu_link_to "Link3", "#"
      = dropdown_divider
      = menu_link_to "Link4", "#"
  = right do
      = menu_link_to "Sign In", "#"
```

### Table Helper

The Table Helper helps you quickly build Bootstrap tables with collections of instances. For example:

```haml
= table_for(@apples, row_decorators: { error: :has_worm?) do
  = column "Hex Color" do |apple|
    - apple.color.to_hex
  = column 'Type of Apple', :type
```

### Button Helper

The button helper renders buttons with the proper Bootstrap markup. You can optionally add icons from the Bootstrap library that are listed [here](http://getbootstrap.com/2.3.2/base-css.html#icons "Bootstrap Icons")

```haml
= primary_button_to "New Store", new_store_path
= primary_button_to "Edit Store", edit_store_path(@store), icon: "edit"
```

```haml
= button_toolbar do
  = button "zoom-in", store
  = button "edit", edit_store_path(@store)
  = button "remove-sign", store, method: :delete
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
