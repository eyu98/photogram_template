class PhotosController < ApplicationController
  before_action :current_user_must_be_photo_owner, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_photo_owner
    photo = Photo.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == photo.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @photos = Photo.all

    render("photo_templates/index.html.erb")
  end

  def show
    @photo = Photo.find(params.fetch("id_to_display"))

    render("photo_templates/show.html.erb")
  end

  def new_form
    @photo = Photo.new

    render("photo_templates/new_form.html.erb")
  end

  def create_row
    @photo = Photo.new

    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")
    @photo.owner_id = params.fetch("owner_id")
    @photo.location = params.fetch("location")

    if @photo.valid?
      @photo.save

      redirect_back(:fallback_location => "/photos", :notice => "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo = Photo.find(params.fetch("prefill_with_id"))

    render("photo_templates/edit_form.html.erb")
  end

  def update_row
    @photo = Photo.find(params.fetch("id_to_modify"))

    @photo.caption = params.fetch("caption")
    @photo.image = params.fetch("image") if params.key?("image")
    
    @photo.location = params.fetch("location")

    if @photo.valid?
      @photo.save

      redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
    else
      render("photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/users/#{@photo.owner_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/photos", :notice => "Photo deleted successfully.")
  end
end
