class FilmGalleryDecorator < GalleryDecorator
  def alt_text
    "Still from #{resource.name} directed by #{resource.filmmakers_names}"
  end

  def alt_text_thumb
    "Thumbnail from #{resource.name} directed by #{resource.filmmakers_names}"
  end

  def back_to_top
    <<-HERE
      <div class="back_to_top">
        <a href="#films"><div></div></a>
      </div>
    HERE
  end

  def heading
    "Posters & Images"
  end

  def resource_id
    resource.url_name
  end

end
