class Todo < ActiveRecord::Base
belongs_to :user
has_many :tags, through: :todo_tags
has_many :todo_tags, dependent: :destroy

def save_categories(tags)
  current_tags = self.tags.pluck(:tag) unless self.tags.nil?
  old_tags = current_tags - tags
  new_tags = tags - current_tags

  # Destroy old taggings:
  old_tags.each do |old_tag|
    self.categories.delete Category.find_by(tag:old_tag)
  end

  # Create new taggings:
  new_tags.each do |new_tag|
    article_category = Category.find_or_create_by(name:new_tag)
    self.categories << article_category
  end
end

end
