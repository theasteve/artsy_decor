require 'pry'

class ProfilesController < ApplicationController
  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.create_profile(profile_params)
    @profile.avatar.attach(params[:profile][:avatar])

    if @profile.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
      respond_to do |format|
        if @profile.update(profile_params)
          format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        else
          format.html {render :edit }
        end
      end
  end

  def delete
    @profile = current_user.profile.find(params[:id])
    @profile.destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :city, :bio, :avatar)
  end
end
