class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def seo_path(*args)
    url = polymorphic_path(*args)
    map = UrlMapping.find_by_url(url)
    map ? map.seo : url
  end
  helper_method :seo_path
end
