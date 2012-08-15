class Comment < ActiveRecord::Base
  attr_accessible :author_name, :body

  validates_presence_of :author_name, :body, :article_id

  belongs_to :article
end
