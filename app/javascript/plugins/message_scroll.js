
const messageScroll = () => {
  const messages = document.querySelector('#conversation-body')
  if (messages) {
    messages.scrollTop = messages.scrollHeight;
  }
}

export { messageScroll };
