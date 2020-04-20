class Post < ApplicationRecord
  def user
    return User.find_by(id: self.user_id)
  end

  validates :deadline_1, {presence: true}
  validates :deadline_2, {presence: true}
  validates :deadline_3, {presence: true}
  validates :deadline_4, {presence: true}
  validates :deadline_5, {presence: true}
  has_many :bookmarks
  has_many :messages
  belongs_to :user


  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
