require "bundler"

ENV["RACK_ENV"] ||= "development"
Bundler.setup(:default, ENV["RACK_ENV"])
Bundler.require

Dir[File.expand_path("../../app/**/*.rb", __FILE__)].each do |file|
  require file
end

set :views, File.expand_path("../../app/views", __FILE__)
set :public_folder, File.expand_path("../../public", __FILE__)

MongoMapper.config = {
  :development  => {"uri" => "mongodb://localhost/todo_development"},
  :test         => {"uri" => "mongodb://localhost/todo_test"},
  :production   => {"uri" => ENV["MONGOLAB_URI"]}
}

MongoMapper.connect(Sinatra::Base.environment)
