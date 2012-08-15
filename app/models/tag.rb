class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings

  def to_s
    name
  end

  def self.all_tags
    order(:name)
  end
end
