require 'spec_helper'

describe Color::Comparison do
  let(:rgb) { [12, 145, 44] }
  let(:match) { [13, 32, 55] }
  let(:instance) { Color::Comparison.new(rgb) }
  let(:rgb_instance) { Color::RGB.from_array(rgb) }

  describe '#compare' do
    subject { Color::Comparison.new(rgb_instance) }

    it 'CIE76 distance should be 90.7247 ' do
      expect(
        subject.compare(
          Color::RGB.from_array(match)
        ).round(4)
      ).to eq(90.7247)
    end
  end

  describe '.distance' do
    it 'converts rgb_color array to RGB' do
      comparitor = Color::Comparison.new(rgb)
      expect(
        comparitor.instance_variable_get(:@rgb_color)
      ).to be_an_instance_of(Color::RGB)
    end

    it 'converts match color array to RGB' do
      expect(instance).to receive(:to_rgb_instance)
        .with(match)
        .and_return(Color::RGB.from_array(match))

      expect(Color::Comparison).to receive(:new)
        .with(rgb)
        .and_return(instance)

      Color::Comparison.distance(rgb, match)
    end

    it 'accepts a Color::RGB' do
      comparitor = Color::Comparison.new(rgb_instance)
      expect(comparitor.instance_variable_get(:@rgb_color)).to be(rgb_instance)
    end

    it 'accepts an RGB instance and does not convert' do
      expect(instance).to_not receive(:to_rgb_instance)

      expect(Color::Comparison).to receive(:new)
        .with(rgb_instance)
        .and_return(instance)

      Color::Comparison.distance(rgb_instance, Color::RGB.from_array(match))
    end
  end
end
