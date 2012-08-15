class UrlMapping < ActiveRecord::Base
  attr_accessible :seo, :url
  validates_presence_of :seo, :url
end
