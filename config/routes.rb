Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/users/:a_user", { :controller => "users", :action => "showdetail" })

end
