require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id,                 Serial
  property :current_user_email, String,  :required => true, :format => :email_address
  property :owner_email,        String,  :required => true, :format => :email_address
  property :date_from,          Date
  property :date_to,            Date
  property :message,            Text
  property :status,             String

  belongs_to :user
  belongs_to :place
end
