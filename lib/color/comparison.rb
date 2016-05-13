module Color
  class Comparison
    attr_reader :rgb_color

    def self.distance(rgb, rgb_match)
      color_comparitor = new(rgb)
      color_comparitor.compare(rgb_match)
    end

    def initialize(rgb_color)
      @rgb_color = rgb_color
      @rgb_color = to_rgb_instance(rgb_color) if rgb_color.is_a?(Array)
    end

    def compare(color)
      color = color.is_a?(Array) ? to_rgb_instance(color) : color
      cie76(rgb_color, color)
    end

    private

    def cie76(subject, match)
      euclidean_distance(
        subject.to_lab,
        match.to_lab
      )
    end

    def euclidean_distance(point_a, point_b)
      Math.sqrt(
        point_a.zip(point_b).map { |a, b| (a - b)**2 }.reduce(:+)
      )
    end

    def to_rgb_instance(rgb_array)
      RGB.from_array(rgb_array)
    end
  end
end
