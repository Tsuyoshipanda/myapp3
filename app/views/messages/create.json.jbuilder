json.date @message.created_at.strftime("%Y/%m/%d %H:%M")
json.message @message.message
json.id @message.id
