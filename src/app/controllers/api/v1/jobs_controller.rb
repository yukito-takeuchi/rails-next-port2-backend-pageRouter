# app/controllers/api/v1/jobs_controller.rb
class Api::V1::JobsController < ApplicationController
  def index
    # 求人一覧を取得する処理を実装する
    render json: { message: '求人一覧' }
  end

  def show
    # 特定の求人を取得する処理を実装する
    render json: { message: '求人詳細' }
  end

  def create
    # 求人を作成する処理を実装する
    render json: { message: '求人作成' }
  end

  def update
    # 求人を更新する処理を実装する
    render json: { message: '求人更新' }
  end

  def destroy
    # 求人を削除する処理を実装する
    render json: { message: '求人削除' }
  end
end