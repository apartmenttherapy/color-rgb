require 'spec_helper'

describe Color::XYZ do
  let(:rgb) { Color::RGB.new(255, 192, 203) }
  subject   { Color::XYZ.new(rgb) }

  describe '.from_rgb' do
    it 'returns an instance of Color::XYZ' do
      expect(Color::XYZ.from_rgb(rgb)).to be_an_instance_of(Color::XYZ)
    end
  end

  describe '#initialize' do
    it 'takes a Color::RGB object and initiates r, g, b attributes' do
      expect(subject.instance_variable_get(:@r)).to eq(rgb.r)
      expect(subject.instance_variable_get(:@g)).to eq(rgb.g)
      expect(subject.instance_variable_get(:@b)).to eq(rgb.b)
    end
  end

  context 'x, y, z' do
    describe '#x' do
      it 'calculates x' do
        expect(subject.x).to eq(70.8691291752058)
      end
    end

    describe '#y' do
      it 'calculates y' do
        expect(subject.y).to eq(63.27107070246611)
      end
    end

    describe '#z' do
      it 'calculates z' do
        expect(subject.z).to eq(64.977242282389)
      end
    end
  end

  describe '#to_a' do
    it 'returns an array of x, y, z values' do
      expect(
        subject.to_a
      ).to eq([70.8691291752058, 63.27107070246611, 64.977242282389])
    end
  end
end
