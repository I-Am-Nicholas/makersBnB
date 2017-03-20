require 'data_mapper'
require 'dm-postgres-adapter'


class Place
  include DataMapper::Resource

  property :id, Serial
  property :Name, String
  property :Location, String
  property :Price, Integer
  property :Description, Text

  belongs_to :users

end
