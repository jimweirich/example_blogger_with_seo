class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :seo_term

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

  def seo_term
    mapping = UrlMapping.find_by_url(my_url)
    mapping ? mapping.seo : nil
  end

  def seo_term=(new_seo_term)
    new_seo_term = normalize_seo_term(new_seo_term)
    mapping = UrlMapping.find_by_url(my_url)
    if new_seo_term.blank?
      mapping.delete if mapping
    elsif mapping && mapping.seo != new_seo_term
      mapping.seo = new_seo_term
      mapping.save
    else
      UrlMapping.create(url: my_url, seo: new_seo_term)
    end
    nil
  end

  private

  def my_url
    "/articles/#{id}"
  end

  def normalize_seo_term(new_seo_term)
    if new_seo_term.blank?
      nil
    elsif new_seo_term.starts_with?('/')
      new_seo_term
    else
      "/#{new_seo_term}"
    end
  end
end
