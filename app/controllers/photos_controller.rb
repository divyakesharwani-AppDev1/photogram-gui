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


end

