app/assets/javascripts/application.js:
  * [ 1] This is a manifest file that'll be compiled into application.js, which will include all the files
  * [ 2] listed below.
  * [ 3]
  * [ 4] Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
  * [ 5] or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
  * [ 6]
  * [ 7] It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
  * [ 8] compiled file.
  * [ 9]
  * [10] WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
  * [11] GO AFTER THE REQUIRES BELOW.
  * [12]
  * [13] = require jquery
  * [14] = require jquery_ujs
  * [15] = require turbolinks
  * [16] = require_tree .

app/assets/javascripts/comments.js.coffee:
  * [ 1] Place all the behaviors and hooks related to the matching controller here.
  * [ 2] All this logic will automatically be available in application.js.
  * [ 3] You can use CoffeeScript in this file: http://coffeescript.org/

app/assets/javascripts/posts.js.coffee:
  * [ 1] Place all the behaviors and hooks related to the matching controller here.
  * [ 2] All this logic will automatically be available in application.js.
  * [ 3] You can use CoffeeScript in this file: http://coffeescript.org/

app/assets/javascripts/welcome.js.coffee:
  * [ 1] Place all the behaviors and hooks related to the matching controller here.
  * [ 2] All this logic will automatically be available in application.js.
  * [ 3] You can use CoffeeScript in this file: http://coffeescript.org/

app/assets/stylesheets/comments.css.scss:
  * [ 1] Place all the styles related to the Comments controller here.
  * [ 2] They will automatically be included in application.css.
  * [ 3] You can use Sass (SCSS) here: http://sass-lang.com/

app/assets/stylesheets/posts.css.scss:
  * [ 1] Place all the styles related to the posts controller here.
  * [ 2] They will automatically be included in application.css.
  * [ 3] You can use Sass (SCSS) here: http://sass-lang.com/

app/assets/stylesheets/welcome.css.scss:
  * [ 1] Place all the styles related to the welcome controller here.
  * [ 2] They will automatically be included in application.css.
  * [ 3] You can use Sass (SCSS) here: http://sass-lang.com/

app/controllers/application_controller.rb:
  * [ 2] Prevent CSRF attacks by raising an exception.
  * [ 3] For APIs, you may want to use :null_session instead.

config/application.rb:
  * [ 5] Require the gems listed in Gemfile, including any gems
  * [ 6] you've limited to :test, :development, or :production.
  * [11] Settings in config/environments/* take precedence over those specified here.
  * [12] Application configuration should go into files in config/initializers
  * [13] -- all .rb files in that directory are automatically loaded.
  * [15] Custom directories with classes and modules you want to be autoloadable.
  * [16] config.autoload_paths += %W(#{config.root}/extras)

config/boot.rb:
  * [ 1] Set up gems listed in the Gemfile.

config/environment.rb:
  * [ 1] Load the Rails application.
  * [ 4] Initialize the Rails application.

config/environments/development.rb:
  * [ 2] Settings specified here will take precedence over those in config/application.rb.
  * [ 4] In the development environment your application's code is reloaded on
  * [ 5] every request. This slows down response time but is perfect for development
  * [ 6] since you don't have to restart the web server when you make code changes.
  * [ 9] Do not eager load code on boot.
  * [12] Show full error reports and disable caching.
  * [16] Don't care if the mailer can't send.
  * [19] Print deprecation notices to the Rails logger.
  * [22] Only use best-standards-support built into browsers.
  * [25] Raise an error on page load if there are pending migrations
  * [28] Debug mode disables concatenation and preprocessing of assets.

config/environments/production.rb:
  * [ 2] Settings specified here will take precedence over those in config/application.rb.
  * [ 4] Code is not reloaded between requests.
  * [ 7] Eager load code on boot. This eager loads most of Rails and
  * [ 8] your application in memory, allowing both thread web servers
  * [ 9] and those relying on copy on write to perform better.
  * [10] Rake tasks automatically ignore this option for performance.
  * [13] Full error reports are disabled and caching is turned on.
  * [17] Enable Rack::Cache to put a simple HTTP cache in front of your application
  * [18] Add `rack-cache` to your Gemfile before enabling this.
  * [19] For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  * [20] config.action_dispatch.rack_cache = true
  * [22] Disable Rails's static asset server (Apache or nginx will already do this).
  * [25] Compress JavaScripts and CSS.
  * [27] config.assets.css_compressor = :sass
  * [29] Whether to fallback to assets pipeline if a precompiled asset is missed.
  * [32] Generate digests for assets URLs.
  * [35] Version of your assets, change this if you want to expire all your assets.
  * [38] Specifies the header that your server uses for sending files.
  * [39] config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  * [40] config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  * [42] Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  * [43] config.force_ssl = true
  * [45] Set to :debug to see everything in the log.
  * [48] Prepend all log lines with the following tags.
  * [49] config.log_tags = [ :subdomain, :uuid ]
  * [51] Use a different logger for distributed setups.
  * [52] config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)
  * [54] Use a different cache store in production.
  * [55] config.cache_store = :mem_cache_store
  * [57] Enable serving of images, stylesheets, and JavaScripts from an asset server.
  * [58] config.action_controller.asset_host = "http://assets.example.com"
  * [60] Precompile additional assets.
  * [61] application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  * [62] config.assets.precompile += %w( search.js )
  * [64] Ignore bad email addresses and do not raise email delivery errors.
  * [65] Set this to true and configure the email server for immediate delivery to raise delivery errors.
  * [66] config.action_mailer.raise_delivery_errors = false
  * [68] Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  * [69] the I18n.default_locale when a translation can not be found).
  * [72] Send deprecation notices to registered listeners.
  * [75] Disable automatic flushing of the log to improve performance.
  * [76] config.autoflush_log = false
  * [78] Use default logging formatter so that PID and timestamp are not suppressed.

config/environments/test.rb:
  * [ 2] Settings specified here will take precedence over those in config/application.rb.
  * [ 4] The test environment is used exclusively to run your application's
  * [ 5] test suite. You never need to work with it otherwise. Remember that
  * [ 6] your test database is "scratch space" for the test suite and is wiped
  * [ 7] and recreated between test runs. Don't rely on the data there!
  * [10] Do not eager load code on boot. This avoids loading your whole application
  * [11] just for the purpose of running a single test. If you are using a tool that
  * [12] preloads Rails for running tests, you may have to set it to true.
  * [15] Configure static asset server for tests with Cache-Control for performance.
  * [19] Show full error reports and disable caching.
  * [23] Raise exceptions instead of rendering exception templates.
  * [26] Disable request forgery protection in test environment.
  * [29] Tell Action Mailer not to deliver emails to the real world.
  * [30] The :test delivery method accumulates sent emails in the
  * [31] ActionMailer::Base.deliveries array.
  * [34] Print deprecation notices to the stderr.

config/initializers/backtrace_silencers.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
  * [ 4] Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }
  * [ 6] You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
  * [ 7] Rails.backtrace_cleaner.remove_silencers!

config/initializers/filter_parameter_logging.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] Configure sensitive parameters which will be filtered from the log file.

config/initializers/inflections.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] Add new inflection rules using the following format. Inflections
  * [ 4] are locale specific, and you may define rules for as many different
  * [ 5] locales as you wish. All of these examples are active by default:
  * [ 6] ActiveSupport::Inflector.inflections(:en) do |inflect|
  * [ 7] inflect.plural /^(ox)$/i, '\1en'
  * [ 8] inflect.singular /^(ox)en/i, '\1'
  * [ 9] inflect.irregular 'person', 'people'
  * [10] inflect.uncountable %w( fish sheep )
  * [11] end
  * [13] These inflection rules are supported but not enabled by default:
  * [14] ActiveSupport::Inflector.inflections(:en) do |inflect|
  * [15] inflect.acronym 'RESTful'
  * [16] end

config/initializers/locale.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  * [ 4] Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  * [ 5] Rails.application.config.time_zone = 'Central Time (US & Canada)'
  * [ 7] The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  * [ 8] Rails.application.config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  * [ 9] Rails.application.config.i18n.default_locale = :de

config/initializers/mime_types.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] Add new mime types for use in respond_to blocks:
  * [ 4] Mime::Type.register "text/richtext", :rtf
  * [ 5] Mime::Type.register_alias "text/html", :iphone

config/initializers/secret_token.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] Your secret key for verifying the integrity of signed cookies.
  * [ 4] If you change this key, all old signed cookies will become invalid!
  * [ 6] Make sure the secret is at least 30 characters and all random,
  * [ 7] no regular words or you'll be exposed to dictionary attacks.
  * [ 8] You can use `rake secret` to generate a secure secret key.
  * [10] Make sure your secret_key_base is kept private
  * [11] if you're sharing your code publicly.

config/initializers/session_store.rb:
  * [ 1] Be sure to restart your server when you modify this file.

config/initializers/wrap_parameters.rb:
  * [ 1] Be sure to restart your server when you modify this file.
  * [ 3] This file contains settings for ActionController::ParamsWrapper which
  * [ 4] is enabled by default.
  * [ 6] Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
  * [11] To enable root element in JSON for ActiveRecord objects.
  * [12] ActiveSupport.on_load(:active_record) do
  * [13] self.include_root_in_json = true
  * [14] end

config/routes.rb:
  * [ 6] index"

db/schema.rb:
  * [ 1] encoding: UTF-8
  * [ 2] This file is auto-generated from the current state of the database. Instead
  * [ 3] of editing this file, please use the migrations feature of Active Record to
  * [ 4] incrementally modify your database, and then regenerate this schema definition.
  * [ 5]
  * [ 6] Note that this schema.rb definition is the authoritative source for your
  * [ 7] database schema. If you need to create the application database on another
  * [ 8] system, you should be using db:schema:load, not running all the migrations
  * [ 9] from scratch. The latter is a flawed and unsustainable approach (the more migrations
  * [10] you'll amass, the slower it'll run and the greater likelihood for issues).
  * [11]
  * [12] It's strongly recommended that you check this file into your version control system.

db/seeds.rb:
  * [ 1] This file should contain all the record creation needed to seed the database with its default values.
  * [ 2] The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
  * [ 3]
  * [ 4] Examples:
  * [ 5]
  * [ 6] cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  * [ 7] Mayor.create(name: 'Emanuel', city: cities.first)

test/controllers/comments_controller_test.rb:
  * [ 4] test "the truth" do
  * [ 5] assert true
  * [ 6] end

test/controllers/posts_controller_test.rb:
  * [ 4] test "the truth" do
  * [ 5] assert true
  * [ 6] end

test/models/comment_test.rb:
  * [ 4] test "the truth" do
  * [ 5] assert true
  * [ 6] end

test/models/post_test.rb:
  * [ 4] test "the truth" do
  * [ 5] assert true
  * [ 6] end

test/test_helper.rb:
  * [ 8] Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  * [ 9]
  * [10] Note: You'll currently still have to declare fixtures explicitly in integration tests
  * [11] -- they do not yet inherit this setting
  * [14] Add more helper methods to be used by all tests here...
