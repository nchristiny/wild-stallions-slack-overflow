class Topic < ActiveRecord::Base
  has_many :questions, through: :question_topic
end
