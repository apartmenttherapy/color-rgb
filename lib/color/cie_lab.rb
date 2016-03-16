# -*- coding: utf-8 -*-
module Color
  class CIELab
    attr_reader :x, :y, :z

    def self.from_xyz(xyz_color)
      new(xyz_color)
    end

    def initialize(color)
      @x = color.x
      @y = color.y
      @z = color.z
    end

    def to_a
      [l, a, b]
    end

    def reference_x
      95.047 # Observer= 2 degrees, Illuminant= D65
    end

    def reference_y
      100.00
    end

    def reference_z
      108.883
    end

    def var_x
      @var_x ||= calculate_var(x / reference_x)
    end

    def var_y
      @var_y ||= calculate_var(y / reference_y)
    end

    def var_z
      @var_z ||= calculate_var(z / reference_z)
    end

    def l
      (116.0 * var_y) - 16.0
    end

    def a
      500.0 * (var_x - var_y)
    end

    def b
      200.0 * (var_y - var_z)
    end

    private

    def calculate_var(value)
      if value > 0.008856
        value**(1.0 / 3.0)
      else
        (7.787 * value) + (16.0 / 116.0)
      end
    end
  end
end
