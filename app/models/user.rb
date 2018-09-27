class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :profile, dependent: :destroy

  has_many :from_messages, class_name: "Message",
          foreign_key: "from_id", dependent: :destroy

  has_many :to_messages, class_name: "Message",
          foreign_key: "to_id", dependent: :destroy

  has_many :sent_messages, through: :from_messages, source: :from

  has_many :received_messages, through: :to_messages, source: :to

  def send_message(other_user, room_id, content)
  from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end

  has_many :posts, dependent: :destroy

  has_many :evils, dependent: :destroy

  has_many :eviling_posts, through: :evils, source: :post

  def already_eviling?(post)
    self.evils.exists?(post_id: post.id)
  end

end
