class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show 
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else 
      render({ :template => "user_templates/show.html.erb" })
    end
  end 

  def create 
   
    input_username = params.fetch("query_username")

    new_user = User.new
    new_user.username = input_username
 
    new_user.save

    redirect_to("/users/" + new_user.username)
  end 

  def update 
    # {"input_image"=>"a", "input_caption"=>"b", "input_owner_id"=>"c"}
    user_id = params.fetch("path_id")

    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)

    
    new_username = params.fetch("query_username")
  
    the_user.username = new_username
  
  

    the_user.save

    redirect_to("/users/" + the_user.username)
  end 
end