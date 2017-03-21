require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource
  include BCrypt


  property :id, Serial
  property :name, String
  property :password_digest, Text
  property :email, String

  has n, :places

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
