require 'data_mapper'
require 'dm-postgres-adapter'

class Place
  include DataMapper::Resource


  property :id, Serial
  property :name, String, :required => true
  property :location, String
  property :price, Integer, :required => true
  property :description, Text, :required => true
  property :date_from, Date
  property :date_to, Date

  belongs_to :user
  has n, :bookings
end
