class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  attr_accessible :email, :name, :password, :password_confirmation, :auth
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 18}

end
