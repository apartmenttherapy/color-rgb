module Color
  class Comparison
    attr_reader :rgb_color

    def self.distance(rgb, rgb_match)
      color_comparitor = self.new(rgb)
      color_comparitor.compare(rgb_match)
    end

    def initialize(rgb_color)
      @rgb_color = rgb_color.is_a?(Array) ? to_rgb_instance(rgb_color) : rgb_color
    end

    def compare(color)
      color = color.is_a?(Array) ? to_rgb_instance(color) : color
      CIE76(rgb_color, color)
    end

    private

    def CIE76(subject, match)
      subject_lab = subject.to_lab
      match_lab = match.to_lab
      Math.sqrt((subject_lab[0] - match_lab[0])**2 + (subject_lab[1] - match_lab[1])**2 + (subject_lab[2] - match_lab[2])**2)
    end

    def to_rgb_instance(rgb_array)
      RGB.from_array(rgb_array)
    end
  end
end
