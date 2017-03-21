require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/place'
require './app/models/user'

DataMapper.setup(:default, "postgres://localhost/bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
