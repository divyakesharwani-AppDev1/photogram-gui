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
    new_url ="/photos/"+new_photo.id.to_s

    redirect_to(new_url)
  end


  def updatephoto
    #Parameters: {"new_img"=>"https://www.iitm.ac.in/sites/default/files/styles/img_m4/public/happenings/press_release/pressrelease21_02_2022_17_31.jpg?itok=omVeCSAp", "new_cap"=>"sdf  update2", "photo_id"=>"954"}
    the_id = params.fetch("photo_id")
    update_image = params.fetch("new_img")
    update_caption = params.fetch("new_cap")


    matching_photos = Photo.where({:id=>the_id})

    the_photo = matching_photos.at(0)
    the_photo.image = update_image
    the_photo.caption = update_caption
    the_photo.save    
    
    
    #render({:template => "photo_template/updatephoto.html.erb"})
    update_url = "/photos/"+ the_photo.id.to_s
    redirect_to(update_url)
    
  end

  def newcomment
    #Parameters: {"new_com_ph_id"=>"777", "new_com_au_id"=>"117", "new_com"=>"sd"}

    newCom_photo_id = params.fetch("new_com_ph_id")
    newCom_Author_id = params.fetch("new_com_au_id")
    newComEntry = params.fetch("new_com")

    newCom = Comment.new
    newCom.photo_id = newCom_photo_id
    newCom.author_id =newCom_Author_id
    newCom.body = newComEntry
    newCom.save

    url_after_new_com = "/photos/"+newCom_photo_id.to_s
    redirect_to(url_after_new_com)
    #render({:template => "photo_template/newcomment.html.erb"})
  end


end

