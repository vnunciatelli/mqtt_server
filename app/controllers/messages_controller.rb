# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast("message_#{@message.receiver}", content: @message.content, sender: @message.sender)
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender, :receiver, :content)
  end
end
