class Admin::UsersController < ApplicationController

  def index
    @users = User.order("firstname").page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "New user #{@user.firstname} has been created!"
    else
      render :new
    end
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User deleted!'
    if @user.destroy
      UserMailer.delete_email(@user).deliver
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user), notice: 'Done!'
    else
      render :edit
    end
  end

    protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
