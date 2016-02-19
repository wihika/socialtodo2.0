class User < ActiveRecord::Base
    attr_accessor :password_confirmation
    has_many :task
    validates :fl_name, length: {maximum: 30,  message: "Invalid name" }, presence: true
    validates :password, length: {maximum: 30,  message: "Invalid password" }, presence: true, confirmation: true
    validates :password_confirmation, presence:true, length: {maximum: 30,  message: "Invalid password" }, presence: true, confirmation: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: {maximum: 30}, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true , uniqueness: { case_sensitive: false, message: "Account with this email already exists!"}
end
