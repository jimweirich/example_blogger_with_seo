module ArticlesHelper

  def tag_links(tags)
    links = tags.map { |t| link_to t.name, tag_path(t) }
    links.join(", ").html_safe
  end

end
