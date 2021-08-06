require 'telegram/bot'

TOKEN = '1905158169:AAFik36gdyl830hgNPnP0x5JWG1HrEktvB8'

ANSWERS = [
  # положительные ответы
  "ДА",
  "очень вероятно",
  "безусловно",
  "без сомнений",
  "должно быть так",
  "абсолютно точно",
  "мне кажется да",
  "духи говорят да",
  "похоже, что да",

  # отрицательные ответы

  "НЕТ",
  "везды говорят,нет",
  "ответ нет",
  "не надейтесь",

  # ответы с сомнениями
  "спросите снова",
  "не могу сказать",
  "ответ не ясен",
  "вряд ли",
  "спросите позже",
  "мало шансов",
  "не похоже"

]
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Здравствуй, #{message.from.first_name}")
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample)
    end
  end
end
