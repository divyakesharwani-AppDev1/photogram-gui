class UsersController < ApplicationController

  def index
     @alluser = User.all.order({:username=> :asc})

    render({:template => "/user_template/index.html.erb"})
  end

  def showdetail
    #Parameters: {"a_user"=>":a_user"}
    

    @theuser = params.fetch("a_user")

    @theusername = User.all.where({:username => @theuser}).at(0)

    if @theusername == nil
      redirect_to("/404")
    else
     render(:template=>"user_template/show.html.erb")
    end
  end


end