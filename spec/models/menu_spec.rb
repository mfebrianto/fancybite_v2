require 'rails_helper'

describe Menu do

  def menu_with_image(image_path)
    picture = described_class.new picture: File.new(Rails.root + image_path)
    picture.valid?
    picture
  end

  describe 'validate' do

    subject do
      menu = described_class.new
      menu.valid?
      menu
    end

    it 'fails validation with no name' do
      expect(subject.errors[:name].count).to eq 1
    end

    it 'fails validation with no description' do
      expect(subject.errors[:description].count).to eq 1
    end

    it 'fails validation with no price' do
      expect(subject.errors[:price].count).to eq 1
    end

    it 'fails validation with no picture' do
      expect(subject.errors[:picture].count).to eq 1
    end
  end

  describe 'validate image size' do
    context 'image size not same as required' do
      subject { menu_with_image('spec/fixtures/images/feature_950x300.jpg') }

      it 'returns error of width' do
        expect(subject.errors[:picture][0]).to eq 'Width must be 300px'
      end

      it 'returns error of height' do
        expect(subject.errors[:picture][1]).to eq 'Height must be 200px'
      end
    end

    context 'image size same as required' do
      subject { menu_with_image('spec/fixtures/images/menu_300x200.jpg') }

      it 'returns no error' do
        expect(subject.errors[:picture]).to be_empty
      end
    end
  end

end