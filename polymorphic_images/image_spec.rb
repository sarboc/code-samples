require 'spec_helper'

describe Image do
  let(:image) { build :image}
  let(:image_2) { build :image}

  describe '.valid' do
    it { should validate_presence_of(:imageable) }
    it { should validate_presence_of(:image_type) }
    it { should validate_presence_of(:image) }
    it { should validate_uniqueness_of(:position) }

    # Because for some reason we're missing the validate_inclusion_of matcher
    it 'requires image_type to be a valid image_type' do
      image.image_type_id = image.image_type_id * 2
      image.valid?.should be_false
    end
  end
end
