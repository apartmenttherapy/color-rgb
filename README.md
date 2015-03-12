# Colorkit

A set of utilities to help with dealing with RGB colors. Supporting

- colorspace conversion from RGB to XYZ or CIE l*a*b*
- determining distance between two colors using CIE76
- storing RGB colors as integers

http://en.wikipedia.org/wiki/CIE_1931_color_space
http://en.wikipedia.org/wiki/Color_difference#CIE76

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'color-rgb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color

## Usage

To instantiate an RGB color

```ruby
Color::RGB.new(r, g, b)          # r, g, b arguments
Color::RGB.from_array([r, g, b]) # an array of RGB values
Color::RGB.from_int(rgb_int)     # int
```

To convert to XYZ or CIE L*a*b*

```ruby
color_rgb = Color::RGB.new(r, g, b)
color_rgb.to_xyz
color_rgb.to_lab
```

Or to convert to an int for storage

```ruby
color_rgb = Color::RGB.new(r, g, b)
color_rgb.to_int
```

Or to go from an Color::RGB instance back to an array of r,g,b values

```ruby
color_rgb.to_a
```

To determine distance / similarity between two RGB colors

```ruby
rgb_one = Color::RGB.new(r, g, b)
rgb_two = Color::RGB.new(other_r, other_g, other_b)

Color::Comparison.distance(rgb_one, rgb_two)
```

If you are planning to compare rgb_one against a number of colors in sequence
tou can instantiate a comparitor object and call compare with any other RGB

```ruby
rgb_one = Color::RGB.new(r, g, b)

comparitor = Color::Comparison.new(rgb_one)
comparitor.compare(some_other_rgb_color) # Color::RGB isntance
comparitor.compare([r, g, b]) # array of RGB values

```

## Contributing

1. Fork it ( https://github.com/apartmenttherapy/color-rgb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
