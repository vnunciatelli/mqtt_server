# app/channels/message_channel.rb
class MessageChannel < ApplicationCable::Channel
  def subscribed
    # A conexão do usuário é feita aqui
    stream_from "message_#{params[:receiver]}"
  end

  def unsubscribed
    # Limpeza quando o usuário se desconectar
  end

  def send_message(data)
    Message.create(sender: data['sender'], receiver: data['receiver'], content: data['content'])
    ActionCable.server.broadcast("message_#{data['receiver']}", content: data['content'], sender: data['sender'])
  end
end
