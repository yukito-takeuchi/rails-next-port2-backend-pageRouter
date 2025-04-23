# app/controllers/api/v1/messages_controller.rb
class Api::V1::MessagesController < ApplicationController
  def index
    # メッセージ一覧を取得する処理を実装する
    render json: { message: 'メッセージ一覧' }
  end

  def show
    # 特定のメッセージを取得する処理を実装する
    render json: { message: 'メッセージ詳細' }
  end

  def create
    # メッセージを作成する処理を実装する
    render json: { message: 'メッセージ作成' }
  end
end
