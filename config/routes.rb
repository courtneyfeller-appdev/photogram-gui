Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/add_user", { :controller => "users", :action => "create" })
  get("/update_user/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  get("/update_photo/:path_id", { :controller => "photos", :action => "update" })

  get("/add_comment", { :controller => "comments", :action => "create" })


end
