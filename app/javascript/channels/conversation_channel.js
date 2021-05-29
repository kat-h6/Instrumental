import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const messages = document.querySelector('#conversation-body')
  if (messages) {
    messages.scrollTop = messages.scrollHeight;
  } // called when data is broadcast in the cable
      },
    });
  }
}



export { initConversationCable };
