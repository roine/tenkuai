class Message < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :message_copies
  has_many :recipients, :through => :message_copies
  before_create :prepare_copies

  attr_accessor :to, :from
  attr_accessible :subject, :body, :to, :from

  def prepare_copies
    return if to.blank?
      receiver = User.find(to)
      message_copies.build(:recipient_id => receiver.id, :folder_id =>receiver.inbox.id, :sender => from)
  end
end
