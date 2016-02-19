class User < ActiveRecord::Base
    attr_accessor :password_confirmation
    has_many :task
    validates :fl_name, length: {maximum: 50, minimum: 1, message: "Invalid name" }
    validates :password, length: {maximum: 50, minimum: 1, message: "Invalid password" }, confirmation: true
    validates :password_confirmation, length: {maximum: 50,  message: "Invalid password" }, confirmation: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true , uniqueness: { case_sensitive: false, message: ": 'Account with this email already exists!'"}
end
