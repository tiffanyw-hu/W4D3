class SessionsController < ApplicationController


  # def index
  #   @cats = Cat.all
  #   render :index
  # end
  #
  # def show
  #   @cat = Cat.find(params[:id])
  #   render :show
  # end
  #
  def new
    logout!
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    user.reset_session_token!
    login!(user)
    flash[:messages] = ["You've successfully logged in"]
    redirect_to cats_url
  end

  def destroy
    logout!
    redirect_to cats_url
  end

  # def edit
  #   @cat = Cat.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @cat = Cat.find(params[:id])
  #   if @cat.update_attributes(cat_params)
  #     redirect_to cat_url(@cat)
  #   else
  #     flash.now[:errors] = @cat.errors.full_messages
  #     render :edit
  #   end
  # end
  #
  # private
  #
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
