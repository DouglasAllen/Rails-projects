# Rails.root/config.ru
require ::File.expand_path('../config/environment', __FILE__)
 
use Rails::Rack::LogTailer
# use ActionDispatch::Static
#run Blog::Application
run Rails.application
