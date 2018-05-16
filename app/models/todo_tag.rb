class TodoTag < ActiveRecord::Base
belongs_to :tag
belongs_to :todo_tag
validates  :todo_id, presence: true
validates  :tag_id,  presence: true
end
