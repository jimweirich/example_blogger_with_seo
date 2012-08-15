# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../lib/seo_url_replacement',  __FILE__)

use SeoUrlReplacement
run Blogger::Application
