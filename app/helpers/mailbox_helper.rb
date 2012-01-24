module MailboxHelper
  SenderList = Array.new
  def has_already_sent?(sender)
    return SenderList.include? sender if SenderList.include? sender
    SenderList<<sender unless SenderList.include? sender
    return false
  end
end
