require File.expand_path("../task", __FILE__)

class List
  include MongoMapper::Document

  many :tasks, :extend => Task::Extensions

  key :name, String

  validates_presence_of :name
end
