class User < ActiveRecord::Base
has_many :articles
validates :username, presence: true, length: {maximum: 9, minimum:4 }, uniqueness: true
validates :email, presence: true, uniqueness: {case_sensitive: false }
has_secure_password
end