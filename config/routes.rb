Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/users/:a_user", { :controller => "users", :action => "showdetail" })
  get("/new_user", { :controller => "users", :action => "newuser" })
  get("/update_user/:a_user", { :controller => "users", :action => "updateuser" })

  get("/photos/:photo_id" ,{:controller => "photos",:action =>"showdetail"})

  get("/delete_photo/:toast_id", {:controller => "photos", :action => "deletephoto"})

  get("/insert_photo",{:controller => "photos",:action => "addphoto"})
  get("/new_comment",{:controller => "photos",:action => "newcomment"})

  get("/update_photo/:photo_id",{:controller => "photos",:action => "updatephoto"})



end
