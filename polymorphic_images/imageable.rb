module Imageable
  extend ActiveSupport::Concern

  included do
    attr_accessible :images_attributes, :bulk_image_id, :bulk_image_files
    attr_accessor :bulk_image_id, :bulk_image_files

    has_many :images, -> { order('position') }, as: :imageable
    accepts_nested_attributes_for :images,
                                  reject_if: :not_actual_image?,
                                  allow_destroy: true

    before_validation :convert_images
  end

  def not_actual_image?(image)
    image["id"].nil? && image["image"].nil?
  end

  def convert_images
    if bulk_image_files && bulk_image_id
      i = images.length
      bulk_image_files.each_with_index do |file, index|
        images.new(image: file, image_type_id: bulk_image_id, position: (i + index))
      end
      self.bulk_image_files = []
    end
  end

  def title_cards
    images.where(image_type_id: ImageType.find_by_name("title card").try(:id))
  end

  def stills
    images.where(image_type_id: ImageType.find_by_name("still").try(:id))
  end

end

