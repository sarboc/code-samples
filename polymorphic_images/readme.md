#Polymorphic Image Galleries

Polymorphic images, first implemented in a gallery context, make it easy to attach images to any model in your application. Their front-end use is governed using an image-type, which can either be populated through a database migration or admined through a basic CRUD setup (see the image-types directory in this project).


####To add images to a model, add the following line:

```
include Imageable
```
Yup. That's it.


####To add image fields to an admin form:

```
<%= render 'shared/image_fields', form: form %>
```
The form object passed to the partial should be whatever builder you are using for your form helper (commonly f, form, etc.).


####To display an image gallery in a view:

```
<%= render 'films/show/image_gallery', gallery_object: FilmGalleryDecorator.new(@film), gallery_images: @film.gallery_images %>
```
This example, for a film image gallery, uses the FilmGalleryDecorator. You can create additional decorators that extend GalleryDecorator or, for more simple image galleries, just use the base class. You will also need to pass the gallery an array of images.