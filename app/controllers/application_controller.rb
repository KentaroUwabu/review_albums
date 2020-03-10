class ApplicationController < ActionController::Base
  
  def authenticate_user
    if current_user == nil
      redirect_to("/users/sign_in")
    end
  end
  
  def move_to_albums_index
    redirect_to("/")
  end
  
end
