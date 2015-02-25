require "color/cie_lab"
require "color/comparison"
require "color/rgb"
require "color/version"
require "color/xyz"

module Color
  class RGBArraySizeError < StandardError; end
  class RGBArrayValueOutOfBoundsError < StandardError; end
end
