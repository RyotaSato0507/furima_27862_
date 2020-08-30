class SessionsController < ApplicationController
  
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id   
    end
  end
end
