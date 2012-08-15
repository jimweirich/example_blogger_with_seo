class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :body

  def tag_list
    tags.join(', ')
  end

  def tag_list=(new_tag_list)
    taggings.destroy_all
    tag_names = new_tag_list.split(/,/).map { |s| s.strip.downcase }.reject { |s| s.empty? }.uniq
    tag_names.each do |name|
      tag = Tag.find_or_create_by_name(name)
      taggings.build(tag: tag)
    end
  end

end
