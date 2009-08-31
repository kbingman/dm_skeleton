ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require "vendor/dependencies/lib/dependencies"
rescue LoadError
  require "dependencies"
end

require "monk/glue"
require "haml"
require "sass"

require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'

class Main < Monk::Glue
  set :app_file, __FILE__
  # uncomment to use the session
  use Rack::Session::Cookie
end

# Connect to datamapper database.
# The ENV call is for Heroku.
DataMapper::setup(:default, ENV['DATABASE_URL'] || settings(:datamapper))

# Load all application files.
Dir[root_path("app/**/*.rb")].each do |file|
  require file
end

Main.run! if Main.run?
