class UsersController < ApplicationController
before_action :set_user, only:[:edit,:update,:show,:destroy]
before_action :require_user, except: [:index,:new,:create]
before_action :require_same_user, except: [:index,:new,:create]
def index
@users = User.all

end
def new
@user = User.new
end
def create
@user = User.new(user_params)

if @user.save
session[:user_id] = @user.id
flash[:notice] = "#{@user.username} is sucessfully signed to alphablog"
redirect_to users_path(@user)
else
render :new
end
end

def edit

end
def update

if @user.update(user_params)
flash[:notice] = "Edited"
redirect_to users_path(current_user)
else
render :edit
end
end
def show

 articl = @user.articles 
end
def destroy
@user.destroy
session[:user_id] = nil
flash[:alert] = "you account has been deleted"
redirect_to articles_path
end
private
def set_user
@user = User.find(params[:id])
end
def user_params
params.require(:user).permit(:username,:email,:password)
end
def require_same_user
if current_user != set_user && !current_user.admin?
flash[:alert] = "you can only edit your own profile"
redirect_to users_path
end
end

end