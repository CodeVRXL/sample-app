class User < ApplicationRecord
  before_save {self.email = email.downcase} #callback method that gets invoked before user is saved into database
                                              #can also be: {self.email = self.email.downcase}
  validates(:name, presence: true, length: {maximum: 50}) #or jsut validates :name, presence: true
                                  # presence: true is a one-element options hash and final arg of validates method
                                        # -> curly braces are OPTIONAL

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  has_secure_password #a built-in Rails hashing and validation method for passwords
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end



end
