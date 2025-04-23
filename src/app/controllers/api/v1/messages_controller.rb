class Api::V1::MessagesController < ApplicationController
  before_action :authorize_request


  
    def index
      @messages = Message.where(sender_id: current_user.id).or(Message.where(receiver_id: current_user.id))
  
      # メッセージとユーザー情報を組み合わせたレスポンスを作成
      messages_with_user_info = @messages.map do |message|
        sender = User.find_by(id: message.sender_id)
        receiver = User.find_by(id: message.receiver_id)
  
        {
          id: message.id,
          sender_id: message.sender_id,
          receiver_id: message.receiver_id,
          content: message.content,
          created_at: message.created_at,
          sender_name: sender&.name,
          sender_icon: sender&.profile&.user_icon.attached? ? url_for(sender.profile.user_icon) : nil,
          receiver_name: receiver&.name,
          receiver_icon: receiver&.profile&.user_icon.attached? ? url_for(receiver.profile.user_icon) : nil
        }
      end
  
      render json: messages_with_user_info
    end


  def show
    # conversationIdは送信者と受信者のidをハイフンで繋げたものです。
    sender_id, receiver_id = params[:id].split('-').map(&:to_i)

    # ユーザーが会話に参加しているか確認します。
    unless [sender_id, receiver_id].include?(current_user.id)
      render json: { error: "許可されていません" }, status: :forbidden
      return
    end

    @messages = Message.where(
      "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",
      sender_id, receiver_id, receiver_id, sender_id
    ).order(created_at: :asc)

    render json: @messages
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      render json: @message, status: :created
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:receiver_id, :content)
  end
end