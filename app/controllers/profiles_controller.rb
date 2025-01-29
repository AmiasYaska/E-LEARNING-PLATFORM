class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user(set_params)
      redirect_to @profile_path, notice: "Profile updated"
    else
      render: :edit, status: :unprocessabke_entity
    end
  end

  private
  def set_params
    params.expect(user: [:first_name, :last_name, :headline, :website])
  end
end
