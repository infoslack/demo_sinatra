require "bundler"

ENV["RACK_ENV"] ||= "development"
Bundler.setup(:default, ENV["RACK_ENV"])
Bundler.require

Dir[File.expand_path("../../app/routes/**/*.rb", __FILE__)].each do
  require file
end
