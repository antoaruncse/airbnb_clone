class User < ActiveRecord::Base

	has_many :properties,dependent: :destroy
	has_many :booking,dependent: :destroy
	before_save{self.email=email.downcase}
	validates :first_name,presence: true ,length: {maximum: 50}
	validates :last_name,presence: true ,length: {maximum: 50}
	validates :mobile,presence: true ,length: {maximum: 10}
	validates :address,presence: true ,length: {maximum: 250}
	validates :country,presence: true ,length: {maximum: 25}
	VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true , format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password
 
  scope :history_by_user, lambda{ | id | {:conditions => ["id =?  ",id]}}

  def self.new_remember_token
      SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token=User.encrypt(User.new_remember_token)
    end

end
