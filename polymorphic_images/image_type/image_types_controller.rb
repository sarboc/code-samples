class Admin::ImageTypesController < ApplicationController
  layout "admin"
  require_permission [ :index, :show, :new, :create, :update, :destroy ] => Permission::EDIT_FILM_CONTENT
  before_filter :find_image_type, only: [:edit, :update, :destroy]

  def index
    @image_types = ImageType.all
  end

  def new
    @image_type = ImageType.new
  end

  def create
    @image_type = ImageType.new(params[:image_type])
    save_and_redirect(:new)
  end

  def edit
  end

  def update
    @image_type.update_attributes(params[:image_type])
    save_and_redirect(:edit)
  end

  def destroy
    if @image_type.images.empty?
      @image_type.destroy
      flash[:success] = "Image type successfully deleted."
      redirect_to admin_image_types_path
    else
      flash[:error] = "That type has images associated with it and cannot be destroyed"
      redirect_to admin_image_types_path
    end

  end

  def find_image_type
    @image_type = ImageType.find(params[:id])
  end

  def save_and_redirect(error_page)
    if @image_type.save
      flash[:success] = "Image type successfully created."
      redirect_to admin_image_types_path
    else
      render error_page
    end
  end

end
