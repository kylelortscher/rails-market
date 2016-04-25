class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/

  validates :username , presence: true, length: { minimum: 3, maximum: 40 }, uniqueness: { case_sensitive: false }, format: { with: VALID_USERNAME_REGEX }

end
