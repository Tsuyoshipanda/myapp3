class Post < ApplicationRecord
  def user
    return User.find_by(id: self.user_id)
  end

  validates :deadline, {presence: true}
end
