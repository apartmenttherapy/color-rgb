# -*- coding: utf-8 -*-
module Color
  class RGB
    attr_reader :r, :g, :b

    def self.from_array(rgb_array)
      if rgb_array.length != 3
        raise RGBArraySizeError.new("RGB array should contain 3 values")
      end
      self.new(rgb_array[0], rgb_array[1], rgb_array[2])
    end

    def self.from_int(rgb_int)
      red   = (rgb_int >> 16) & 0xFF;
      green = (rgb_int >> 8) & 0xFF;
      blue  = rgb_int & 0xFF;
      self.new(red, green, blue)
    end

    def initialize(r, g, b)
      @r = r.to_f
      @g = g.to_f
      @b = b.to_f

      validate_values
    end

    def to_lab
      x, y, z = to_xyz
      xyz_to_cie_lab(x, y, z)
    end

    def to_xyz
      var_R = ( r / 255.0)        # R from 0 to 255
      var_G = ( g / 255.0)        # G from 0 to 255
      var_B = ( b / 255.0)        # B from 0 to 255

      if ( var_R > 0.04045)
        var_R = ( ( var_R + 0.055) / 1.055) ** 2.4
      else
        var_R = var_R / 12.92
      end

      if ( var_G > 0.04045)
        var_G = ( ( var_G + 0.055) / 1.055) ** 2.4
      else
        var_G = var_G / 12.92
      end

      if ( var_B > 0.04045)
        var_B = ( ( var_B + 0.055) / 1.055) ** 2.4
      else
        var_B = var_B / 12.92
      end

      var_R = var_R * 100
      var_G = var_G * 100
      var_B = var_B * 100

      # Observer. = 2°, Illuminant = D65
      x = var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805
      y = var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722
      z = var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505
      [x, y, z]
    end

    def xyz_to_cie_lab(x, y, z)
      ref_X =  95.047   # Observer= 2°, Illuminant= D65
      ref_Y = 100.000
      ref_Z = 108.883

      var_X = x / ref_X
      var_Y = y / ref_Y
      var_Z = z / ref_Z

      if ( var_X > 0.008856)
        var_X = var_X ** ( 1.0/3.0)
      else
        var_X = ( 7.787 * var_X) + ( 16.0 / 116.0)
      end

      if ( var_Y > 0.008856)
        var_Y = var_Y ** ( 1.0/3.0)
      else
        var_Y = ( 7.787 * var_Y) + ( 16.0 / 116.0)
      end

      if ( var_Z > 0.008856)
        var_Z = var_Z ** ( 1.0/3.0)
      else
        var_Z = ( 7.787 * var_Z) + ( 16 / 116)
      end

      l = ( 116.0 * var_Y) - 16.0
      a = 500.0 * ( var_X - var_Y)
      b = 200.0 * ( var_Y - var_Z)
      [l, a, b]
    end

    def to_int
      rgb_int = r.to_i
      rgb_int = (rgb_int << 8) + g.to_i
      rgb_int = (rgb_int << 8) + b.to_i
    end

    def to_a
      [r.to_i, g.to_i, b.to_i]
    end

    private

    def validate_values
      if r > 255
        raise Color::RGBArrayValueOutOfBoundsError.new("R is #{r}")
      end

      if g > 255
        raise Color::RGBArrayValueOutOfBoundsError.new("G is #{g}")
      end

      if b > 255
        raise Color::RGBArrayValueOutOfBoundsError.new("B is #{b}")
      end
    end
  end
end
