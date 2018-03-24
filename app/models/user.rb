class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  require "faker"
  before_save { generate_avatar }
  acts_as_voter
  include Gravtastic
  gravtastic size: 150
  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, length: {minimum:6, maximum:30}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def generate_avatar
    if self.avatar_url.blank?
      self.avatar_url = Faker::Avatar.image("#{SecureRandom.urlsafe_base64}", "150x150", "jpg", "set4", "bg2")
    end
  end

end
