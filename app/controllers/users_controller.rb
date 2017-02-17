class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)

    else
      fail
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def show
    @user = User.find_by(id: params[:id])

    if @user

    else

    end

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
