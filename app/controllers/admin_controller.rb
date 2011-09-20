class AdminController < ApplicationController
  layout 'home'

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash.now[:error] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
  end

  def index
  end

end
