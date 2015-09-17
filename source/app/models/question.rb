class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
  has_many :tags
  has_many :topics, through: :tags
end
