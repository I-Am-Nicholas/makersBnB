require 'data_mapper'
require 'dm-postgres-adapter'
class Place
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :location, String
  property :price, Integer
  property :description, Text

  # belongs_to :user

end
