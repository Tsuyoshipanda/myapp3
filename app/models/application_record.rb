class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def self.search(search)
  #   if search
  #     Post.where(['name LIKE ?', "%#{search}%"])
  #   else
  #     Post.all
  #   end
  # end

end
