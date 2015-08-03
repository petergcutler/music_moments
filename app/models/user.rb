class User < ActiveRecord::Baseclass User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :posts, dependent: :destroy
end
