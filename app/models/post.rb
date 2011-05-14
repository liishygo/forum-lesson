class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :forum_id
  validates_presence_of :user_id
  
  belongs_to :forum
  belongs_to :user
end
