# Color

Help with colorspace conversion from RGB to XYZ to CIE*Lab and for
determing similarity distance between two colors using CIE76

http://en.wikipedia.org/wiki/CIE_1931_color_space
http://en.wikipedia.org/wiki/Color_difference#CIE76

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color

## Usage

```ruby
color_rgb = Color::RGB.new(r, g, b)
color_cie_lab = color_rgb.to_lab
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/color/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
