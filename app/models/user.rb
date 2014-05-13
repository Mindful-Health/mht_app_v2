class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :care_group
  has_many :patients, through: :care_group
  
  before_save { self.email = email.downcase }
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def login=(login)
  	@login = login
  end

  def login
  	@login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  #def password_match?
  #  self.errors[:password] << "can't be blank" if password.blank?
  #  self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
  #  self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
  #  password == password_confirmation && !password.blank?
  #end

end
