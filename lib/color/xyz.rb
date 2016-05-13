# -*- coding: utf-8 -*-
module Color
  class XYZ
    attr_reader :r, :g, :b

    def self.from_rgb(rgb_color)
      new(rgb_color)
    end

    def initialize(color)
      @r = color.r.to_f
      @g = color.g.to_f
      @b = color.b.to_f
    end

    def to_a
      [x, y, z]
    end

    def x
      @x ||= (var_r * 0.4124 + var_g * 0.3576 + var_b * 0.1805)
    end

    def y
      @y ||= (var_r * 0.2126 + var_g * 0.7152 + var_b * 0.0722)
    end

    def z
      @z ||= (var_r * 0.0193 + var_g * 0.1192 + var_b * 0.9505)
    end

    def var_r
      @var_r ||= convert(:r)
    end

    def var_g
      @var_g ||= convert(:g)
    end

    def var_b
      @var_b ||= convert(:b)
    end

    def convert(value)
      variable = (send(value) / 255.0)
      if variable > 0.04045
        variable = ((variable + 0.055) / 1.055)**2.4
      else
        variable /= 12.92
      end
      variable * 100
    end
  end
end
