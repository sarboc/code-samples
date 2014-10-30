class ImageType < ActiveRecord::Base
  strip_attributes
  has_many :images
  validates :name, presence: true, uniqueness: true

  attr_accessible :name

  before_validation :downcase_name

  def downcase_name
    self.name = name.downcase if name
  end

end
