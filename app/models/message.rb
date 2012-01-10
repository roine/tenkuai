class Message < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :message_copies
  has_many :recipients, :through => :message_copies
  before_create :prepare_copies

  attr_accessor :to
  attr_accessible :subject, :body, :to

  def prepare_copies
    return if to.blank?

    to.each do |r|
      r = User.find(r)
      message_copies.build(:recipient_id => r.id, :folder_id =>r.inbox.id)
    end
  end
end
