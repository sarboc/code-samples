class GalleryDecorator
  attr_accessor :resource

  def initialize(resource)
    @resource = resource
  end

  def back_to_top
  end
end
