# app/controllers/api/v1/profiles_controller.rb
class Api::V1::ProfilesController < ApplicationController
  before_action :authorize_request
  before_action :set_profile, only: [:show, :update]

  def show
    if @profile
      user_icon_url = @profile.user_icon.attached? ? url_for(@profile.user_icon) : nil
      bg_image_url = @profile.bg_image.attached? ? url_for(@profile.bg_image) : nil

      render json: @profile.as_json.merge(user_icon_url: user_icon_url, bg_image_url: bg_image_url)
    else
      render json: { error: 'Profile not found' }, status: :not_found
    end
  end

  def create
    if current_user.profile.present? # ユーザーが既にプロファイルを持っている場合
      @profile = current_user.profile
       if @profile.update(profile_params) #update
        handle_images
        render json: @profile.as_json.merge(user_icon_url: @profile.user_icon.attached? ? url_for(@profile.user_icon) : nil, bg_image_url: @profile.bg_image.attached? ? url_for(@profile.bg_image) : nil), status: :ok
       else
         render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
       end
    else
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        handle_images
        render json: @profile.as_json.merge(user_icon_url: @profile.user_icon.attached? ? url_for(@profile.user_icon) : nil, bg_image_url: @profile.bg_image.attached? ? url_for(@profile.bg_image) : nil), status: :created
      else
        render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
      end
    end
  rescue => e #エラーハンドリング
    render json: { error: "Failed to create/update profile: #{e.message}" }, status: :internal_server_error
  end


  def update
    if @profile
      if @profile.update(profile_params)
        if params[:user_icon]
          @profile.user_icon.attach(params[:user_icon])
        end
        if params[:bg_image]
          @profile.bg_image.attach(params[:bg_image])
        end
        user_icon_url = @profile.user_icon.attached? ? url_for(@profile.user_icon) : nil
        bg_image_url = @profile.bg_image.attached? ? url_for(@profile.bg_image) : nil

        render json: @profile.as_json.merge(user_icon_url: user_icon_url, bg_image_url: bg_image_url)
      else
        render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Profile not found' }, status: :not_found
    end
  end

  private

  def profile_params
    params.permit(:introduction, :skills, :company_name, :industry)
  end

  def set_profile
    @profile = current_user.profile
  end
end