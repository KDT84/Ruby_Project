ENV["RACK_ENV"] ||= "development"

#The following code is used to load the default group (anything not explicitly in a group) and the development group.
require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = :info

require_all 'app/models'
