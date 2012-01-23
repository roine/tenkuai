module SentHelper
  def status_to_word(status)
    return 'new' if status == 1
    return 'old' if status == 2
  end
end
