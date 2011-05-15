class Forum < ActiveRecord::Base
  #cattr_reader :per_page
  #@@per_page = 3
  
  validates_presence_of :name
  
  has_many :posts
  
end
