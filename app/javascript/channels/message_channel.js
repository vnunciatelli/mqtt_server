import consumer from "./consumer"

const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("Conectado ao canal de mensagens");
  },

  disconnected() {
    console.log("Desconectado do canal de mensagens");
  },

  received(data) {
    console.log("Nova mensagem recebida:", data);
    // Aqui você pode adicionar código para exibir a mensagem na interface
  },

  sendMessage(sender, receiver, content) {
    this.perform("send_message", { sender: sender, receiver: receiver, content: content });
  }
});

export default messageChannel;
