class User < ActiveRecord::Base
  has_and_belongs_to_many :gifs
  has_secure_password
end
