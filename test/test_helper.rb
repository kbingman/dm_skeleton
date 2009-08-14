ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "init"))

require "rack/test"
require "contest"
require "override"
require "quietbacktrace"

DataMapper.setup(:default, "sqlite3::memory:")

class Test::Unit::TestCase
  include Rack::Test::Methods
  
  def setup
    # Uncomment if you want to reset the database
    # before each test.
    DataMapper.auto_migrate!
  end

  def app
    Main.new
  end
end
