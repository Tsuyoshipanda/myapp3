class User < ApplicationRecord

  validates :email, {uniqueness: true, presence: true}
  validates :password, {presence: true}
  validates :name, {presence: true}

  has_many :messages
  has_many :bookmarks
  has_many :posts
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :chats

  def posts
    return Post.where(user_id: self.id)
  end

end
