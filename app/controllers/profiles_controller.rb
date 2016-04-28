class ProfilesController < ApplicationController

  def edit
    @user = current_user
  end

  def show
    if params[:id]
      @users = User.find(params[:id])
    elsif
      @user = current_user
    end
  end

  def update
    @users = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to edit_profile_path, notice: 'Good to go!'
    else
      render :edit
    end
  end

  def profile_params
    params.require(:user).permit(:id, :email, :firstname)
  end
end
