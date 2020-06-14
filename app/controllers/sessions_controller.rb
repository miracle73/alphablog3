class SessionsController < ApplicationController

def new

end
def create 

user = User.find_by(email: params[:session][:email])
 if user && user.authenticate(params[:session][:password])
session[:user_id] = user.id
flash[:notice] = "You have sucessfully login in"
redirect_to users_path(user)

else
 flash[:notice] = "Login information not correct"
render :new

end
end
def destroy
session[:user_id] = nil
flash[:notice] = "you have logged out"
redirect_to root_path
end

end