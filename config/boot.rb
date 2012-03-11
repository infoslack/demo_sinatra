require "bundler"

ENV["RACK_ENV"] ||= "development"
Bundler.setup(:default, :local)
Bundler.require

files = Dir[File.expand_path("../../app/**/*.rb", __FILE__)].sort

files.each do |file|
  require file
end

set :views, File.expand_path("../../app/views", __FILE__)
set :public_folder, File.expand_path("../../public", __FILE__)
enable :sessions
set :session_secret, "28096d628c6afb27d2af1973dd4cfca2b11eb1d5856b612bc2e80766ebb2a300e530d1a663e5a178"

MongoMapper.config = {
  :development  => {"uri" => "mongodb://localhost/todo_development"},
  :test         => {"uri" => "mongodb://localhost/todo_test"},
  :production   => {"uri" => ENV["MONGOLAB_URI"]}
}

MongoMapper.connect(Sinatra::Base.environment)
