class SeoUrlReplacement
  def initialize(app)
    @app = app
  end

  def call(env)
    map = UrlMapping.find_by_seo(env['PATH_INFO'])
    env['PATH_INFO'] = map.url  if map
    @app.call(env)
  end

end
