class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show 
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    if @the_photo == nil
      redirect_to("/404")
    else 
      render({ :template => "photo_templates/show.html.erb" })
    end
  end 

  def delete 
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end 

  def create 
    # {"input_image"=>"a", "input_caption"=>"b", "input_owner_id"=>"c"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)
  end 
end