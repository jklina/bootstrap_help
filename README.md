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

`
= main_nav(brand: "My Awesome Company") do
  = dropdown_menu "My Menu" do
    = dropdown_item "Link1", "#"
    = dropdown_item "Link2", "#"
    = dropdown_item "Link3", "#"
    = dropdown_divider
    = dropdown_item "Link4", "#"
`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
