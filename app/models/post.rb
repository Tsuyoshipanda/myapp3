class Post < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  def user
    return User.find_by(id: self.user_id)
  end

  validates :deadline, {presence: true}
  validates :task, {presence: true}
  validates :task_type, {presence: true}
  has_many :bookmarks
  has_many_attached :images
  belongs_to :user

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
