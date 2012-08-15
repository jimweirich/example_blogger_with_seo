class UrlMapping < ActiveRecord::Base
  attr_accessible :seo, :url
  validates_presence_of :seo, :url
  validates_uniqueness_of :seo
  validates_uniqueness_of :url

  def self.by_seo
    order(:seo)
  end

  def self.by_url
    order(:url)
  end
end
