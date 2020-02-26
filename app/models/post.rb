class Post < ApplicationRecord
  def user
    return User.find_by(id: self.user_id)
  end

  validates :deadline, {presence: true}
  has_many :bookmarks
  belongs_to :user

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
