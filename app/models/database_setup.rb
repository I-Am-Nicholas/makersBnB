require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/place'
require './app/models/user'
require './app/models/booking'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
