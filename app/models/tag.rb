class Tag < ActiveRecord::Base
  validates :tag, presence:true
  has_many :todos, through: :todo_tags
  has_many :todo_tags, dependent: :destroy
end
