class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_validation :normalice_email
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/ }
  after_create_commit :send_verification_email
  has_secure_password 

  def normalice_email
    self.email = email.downcase.strip
  end

  def send_verification_email
    UserMailer.with(user: self).verification_email.deliver_later
  end 

end
