# app/controllers/api/v1/authentication_controller.rb
class Api::V1::AuthenticationController < ApplicationController
  def login
    # ログイン処理を実装する
    render json: { message: 'ログイン' }
  end

  def logout
    # ログアウト処理を実装する
    render json: { message: 'ログアウト' }
  end
end