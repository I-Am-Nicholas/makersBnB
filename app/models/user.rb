require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource
  include BCrypt

  property :id,              Serial
  property :name,            String,  :required => true,
  :messages => {
    :presence   => "Empty field: please check sign up form and try again"
  }

  property :password_salt, Text,      :required => true
  property :email,           String,  :required => true, :format => :email_address, :unique => true,
  :messages => {
    :presence   => "Missing fields: Email address required",
    :is_unique  => "Email conflict: Email address is already in use",
    :format     => "Format error: Email address is not typed properly"
  }
  has n, :places

  attr_reader :password
  attr_accessor :password_confirmation


  def password=(password)
    @password = password
    self.password_salt = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password, :message => "Password and Confirmation do not match"
  validates_length_of :password, :min => 6, :message => "Password must be longer than 6 characters"

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_salt) == password
  end

end
