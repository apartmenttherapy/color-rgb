require 'spec_helper'

describe Color::RGB do
  describe '#inititalize' do
    it 'takes R, G, B as args' do
      color = Color::RGB.new(12, 13, 14)
      expect(color.r).to eq(12.0)
      expect(color.g).to eq(13.0)
      expect(color.b).to eq(14.0)
    end

    it 'raises an error if  R, G, B args are greater than 255' do
      expect{
        Color::RGB.new(12, 13, 355)
      }.to raise_error(Color::RGBArrayValueOutOfBoundsError)
    end
  end

  context 'packing to integers' do
    let(:rgb)   { [255, 20, 147] }
    let(:color) { Color::RGB.from_array(rgb) }
    let(:packed) { 16716947 }

    describe '.to_int' do
      it 'translates ' do
        expect(color.to_int).to eq packed
      end
    end

    describe '.from_int' do
      it 'packs rgb values into an int for db storage' do
        expect(Color::RGB.from_int(packed).to_a).to eq(rgb)
      end
    end
  end

  describe '#to_a' do
    it 'returns an array of integers representing RGB' do
      expect(Color::RGB.new(23, 56, 77).to_a).to eq([23, 56, 77])
    end
  end

  describe '.from_array' do
    it 'builds an RGB object' do
      color = Color::RGB.from_array([12, 13, 14])
      expect(color).to be_an_instance_of(Color::RGB)
      expect(color.r).to eq(12.0)
      expect(color.g).to eq(13.0)
      expect(color.b).to eq(14.0)
    end

    context 'errors' do
      it 'will raise an exception if an array is < 3 values' do
        expect{ Color::RGB.from_array([]) }.to raise_error(Color::RGBArraySizeError)
      end

      it 'will raise an exception if an array is not > values' do
        expect{
          Color::RGB.from_array([1, 2, 3, 4])
        }.to raise_error(Color::RGBArraySizeError)
      end

      it 'will raise an exception if array values are greater than 255' do
        expect{
          Color::RGB.from_array([1, 2, 333])
        }.to raise_error(Color::RGBArrayValueOutOfBoundsError)
      end
    end
  end

  context 'color conversions' do
    let(:rgb) { [34, 155, 167] }

    describe '#to_lab' do
      it 'should convert to expected values' do
        color = Color::RGB.from_array(rgb)
        expect(color.to_lab).to eq([
            58.57679489951133,
            -27.28307080696585,
            -15.45207927427481
          ])
      end
    end

    describe '#to_xyz' do
      it 'should convert to expected values' do
        color = Color::RGB.from_array(rgb)
        expect(color.to_xyz).to eq([
            19.356083204751798,
            26.57279128189712,
            40.66810545648842
          ])
      end
    end
  end
end
