class Article < ActiveRecord::Base
  attr_accessible :title, :body
  validates_presence_of :title, :body
end
