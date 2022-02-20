class PhotosController < ApplicationController

  def index
  
    render({:template => "/photo_template/index.html.erb"})
  end

end