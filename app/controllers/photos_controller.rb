class PhotosController < ApplicationController

  def index


    @allphotos = Photo.all.order({:created_at => :desc})
    render({:template => "/photo_template/index.html.erb"})
  end

end

