require 'spec_helper'

describe Color::CIELab do
  let(:rgb) { Color::RGB.new(255, 192, 203) }
  let(:xyz) { Color::XYZ.new(rgb) }

  subject { Color::CIELab.new(xyz) }

  describe '.from_xyz' do
    it 'returns an instance of Color::CIELab' do
      expect(Color::CIELab.from_xyz(xyz)).to be_an_instance_of(Color::CIELab)
    end
  end

  describe '#initialize' do
    it 'takes a Color::XYZ object and initiates x, y, z attributes' do
      expect(subject.instance_variable_get(:@x)).to eq(xyz.x)
      expect(subject.instance_variable_get(:@y)).to eq(xyz.y)
      expect(subject.instance_variable_get(:@z)).to eq(xyz.z)
    end
  end

  context 'l,a,b' do
    describe '#b' do
      it 'calculates l' do
        expect(subject.l.round(5)).to eq(83.58479885775868.round(5))
      end
    end

    describe '#a' do
      it 'calculates a' do
        expect(subject.a.round(5)).to eq(24.14966101257138.round(5))
      end
    end

    describe '#b' do
      it 'calculates b' do
        expect(subject.b.round(5)).to eq(3.315387151150806.round(5))
      end
    end
  end

  describe '#to_a' do
    it 'returns an array of l,a,b values' do
      expect(
        subject.to_a.map { |val| val.round(5) }
      ).to eq(
        [
          83.58479885775868.round(5),
          24.14966101257138.round(5),
          3.315387151150806.round(5)
        ]
      )
    end
  end
end
