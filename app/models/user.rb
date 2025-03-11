class User < ApplicationRecord
    has_secure_password
    has_many :articles, dependent: :destroy
    
    validates :email, presence: true, uniqueness: true, 
              format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  end