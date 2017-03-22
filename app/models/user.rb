require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  # validates_confirmation_of :password

  property :id,              Serial
  property :name,            String,  :required => true
  property :password_digest, Text,    :required => true
  property :email,           String,  :required => true

  has n, :places

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
