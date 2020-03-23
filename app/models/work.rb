class Work < ApplicationRecord
  belongs_to :post, counter_cache: :work_count
  belongs_to :user
end
