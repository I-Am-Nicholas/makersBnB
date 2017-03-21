require 'data_mapper'
require 'dm-postgres-adapter'


class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :password, Text
  property :email, String

  has n, :places

end
