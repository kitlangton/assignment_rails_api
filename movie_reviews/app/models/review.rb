class Review < ActiveRecord::Base
  belongs_to :movie
  validates :movie, presence: true
  paginates_per 10
end
