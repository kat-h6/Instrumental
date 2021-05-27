
const messageScroll = () => {
  const messages = document.querySelector('#conversation-body')
  messages.scrollTop = messages.scrollHeight;

}

export { messageScroll };
