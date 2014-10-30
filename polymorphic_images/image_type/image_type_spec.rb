require 'spec_helper'

describe ImageType do
  describe '.valid' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
