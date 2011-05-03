class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author
  validates_presence_of :forum_id
  
  belongs_to :forum
  belongs_to :user
end
