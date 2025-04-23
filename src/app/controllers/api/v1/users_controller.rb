# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < ApplicationController
  def show_by_id
    # IDでユーザーを取得する処理を実装する
    render json: { message: 'ユーザー詳細 (ID指定)' }
  end

  def index
    # ユーザー一覧を取得する処理を実装する
    render json: { message: 'ユーザー一覧' }
  end

  def show
    # 特定のユーザーを取得する処理を実装する
    render json: { message: 'ユーザー詳細' }
  end

  def create
    # ユーザーを作成する処理を実装する
    render json: { message: 'ユーザー作成' }
  end

  def update
    # ユーザーを更新する処理を実装する
    render json: { message: 'ユーザー更新' }
  end

  def destroy
    # ユーザーを削除する処理を実装する
    render json: { message: 'ユーザー削除' }
  end
end
