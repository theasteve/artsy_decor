# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  def show
    @user =  User.find(params[:id])
  end

  def edit
    @user =  current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :city, :bio, :avatar)
  end
end
