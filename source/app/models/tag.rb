class Tag < ActiveRecord::Base
  belongs_to :topic
  belongs_to :question
  validates :name, presence: true, uniqueness: true
  
end
