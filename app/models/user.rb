class User < ApplicationRecord

  validates :email, {uniqueness: true, presence: true}
  validates :password, {presence: true}
  validates :name, {presence: true}

  has_many :messages

  def posts
    return Post.where(user_id: self.id)
  end

end
