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
     render({:template=>"user_template/show.html.erb"})
    end
  end

  def newuser
    #Parameters: {"username"=>"kiok"}
    
    new_user = params.fetch("username")

    a_new_user = User.new
    a_new_user.username = new_user
    a_new_user.save

    new_user_url = "/users/"+new_user
    redirect_to(new_user_url)
    

    #render({:template=>"user_template/newuser.html.erb"})
  end

  def updateuser
    #Parameters: {"edit_uname"=>"anisaaaa", "a_user"=>"anisa"}

    the_user = params.fetch("a_user")
    update_user = params.fetch("edit_uname")

    #the_user.username = update_user
    matching_user = User.where({:username=>the_user})
    updating_user = matching_user.at(0)
    updating_user.username = update_user
    updating_user.save

    url_after_user_update = "/users/" + update_user
    redirect_to(url_after_user_update)
    #render({:template=>"user_template/updateuser.html.erb"})
  end


end