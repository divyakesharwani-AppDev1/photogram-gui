class PhotosController < ApplicationController

  def index

    @allphotos = Photo.all.order({:created_at => :desc})
    render({:template => "/photo_template/index.html.erb"})
  end

  def showdetail

    # Parameters: {"photo_id"=>"785"}
    photo_id = params.fetch("photo_id")
    @thephoto = Photo.all.where({:id => photo_id}).at(0)

    if @thephoto == nil
      redirect_to("/404")
    else
      render({:template => "/photo_template/show.html.erb"})
    end
  end

  def deletephoto

    #  Parameters: {"toast_id"=>"899"}

    the_id = params.fetch("toast_id")

    the_photo = Photo.where({:id => the_id}).at(0)

    the_photo.destroy

    
    
    #render({:template => "photo_template/delete.html.erb"})
    redirect_to("/photos")

  end

  def addphoto
    #Parameters: {"url_of_img"=>"https://www.iitm.ac.in/sites/default/files/styles/img_m4/public/happenings/press_release/pressrelease21_02_2022_17_31.jpg?itok=omVeCSAp", "cap_of_img"=>"asfs", "id_of_img_own"=>"117"}

    input_image = params.fetch("url_of_img")
    input_caption = params.fetch("cap_of_img")
    input_owner_id = params.fetch("id_of_img_own")


    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id
    new_photo.save

    #render({:template => "photo_template/addphoto.html.erb"})
    redirect_to("/photos/"+new_photo.id.to_s)
  end

end

