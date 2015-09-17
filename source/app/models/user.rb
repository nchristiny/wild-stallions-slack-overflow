require 'bcrypt'

class User < ActiveRecord::Base
  has_many :comments
  has_many :questions
  has_many :answers
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, input_password)
    user = User.find_by(email: email)
    if user.password == input_password
      user
    else
      nil
    end
  end

end
