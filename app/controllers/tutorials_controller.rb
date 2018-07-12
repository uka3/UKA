class TutorialsController < ApplicationController

  def new
    @profile = current_user.build_profile
    @profile.build_movie
  end

  def edit
    if request.get?
      @profile = current_user.profile
    elsif request.post?
      @profile = current_user.build_profile(profile_attributes)
      @profile.save
    elsif request.patch?
      if current_user.profile.update(profile_attributes)
        redirect_to root_path
      else
        @profile = current_user.profile
      end
    end
  end

  private
  def profile_attributes
    params.require(:profile).permit(profile_params)
  end

  def profile_params
    [
      :script,
      movie_attributes: [
        :id,:video
      ]
    ]
  end
end
