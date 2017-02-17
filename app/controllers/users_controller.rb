class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to bands_url

    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render :show
    else
      
    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
