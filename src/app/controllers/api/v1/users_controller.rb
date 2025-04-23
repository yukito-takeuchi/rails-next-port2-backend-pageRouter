class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: [:create, :show_by_id]
  before_action :set_user, only: [:show, :update, :destroy]

  def show_by_id
    @user = User.find_by(id: params[:id])
    if @user
      @profile = @user.profile
      user_icon_url = nil
      bg_image_url = nil
  
      if @profile
        if @profile.user_icon&.attached?
          user_icon_url = url_for(@profile.user_icon)
        elsif @profile.respond_to?(:user_icon_url) && @profile.user_icon_url.present?
          user_icon_url = @profile.user_icon_url
        end
  
        if @profile.bg_image&.attached?
          bg_image_url = url_for(@profile.bg_image)
        elsif @profile.respond_to?(:bg_image_url) && @profile.bg_image_url.present?
          bg_image_url = @profile.bg_image_url
        end
  
        render json: {
          id: @user.id,
          name: @user.name,
          user_type: @user.user_type,
          profile: {
            user_icon_url: user_icon_url,
            bg_image_url: bg_image_url
          }
        }
      else
          render json: {
            id: @user.id,
            name: @user.name,
            user_type: @user.user_type,
            profile: nil
          }
      end
    else
      render json: { error: "User with id #{params[:id]} not found" }, status: :not_found
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # プロフィールを自動作成
      @profile = @user.build_profile
      @profile.save

      render json: { user: { id: @user.id } }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :user_type)
  end

  def set_user
    @user = User.find(params[:id])
  end
end