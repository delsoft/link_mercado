require 'securerandom'

class User < ActiveRecord::Base
  before_create :set_activation_code
  before_save :encrypt_password
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :email, presence: true  
  validates :email, uniqueness: true
  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }
  validates :password, presence: true, on: :create
  
  def self.authenticate(email, password)
    user = find_by_email(email)  
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
      user  
    else  
      nil  
    end      
  end
  
  private
  def set_activation_code
    self.activation_code = SecureRandom.hex(16)
  end
  
  def encrypt_password
    if password.present?  
      self.password_salt = BCrypt::Engine.generate_salt  
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
    end
  end
end
