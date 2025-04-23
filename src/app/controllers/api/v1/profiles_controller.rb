# app/controllers/api/v1/profiles_controller.rb
class Api::V1::ProfilesController < ApplicationController
  def show
    # プロフィールを取得する処理を実装する
    render json: { message: 'プロフィール' }
  end

  def create
    # プロフィールを作成する処理を実装する
    render json: { message: 'プロフィール作成' }
  end

  def update
    # プロフィールを更新する処理を実装する
    render json: { message: 'プロフィール更新' }
  end
end
