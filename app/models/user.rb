class User < ApplicationRecord
  has_many :vinyls
  has_many :songs, through: :vinyls
  has_many :artists, through: :vinyls

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, 
  :omniauthable 
 #  omniauth_providers: [:google_oauth2]
  def self.google_omniauth(auth)
    # binding.pry
   where(provider: auth["provider"], uid: auth["uid"]).first_or_create(email: auth["info"]["email"]) do |user|
       user.username = auth.info.name
       user.first_name = auth.info.first_name
       user.last_name = auth.info.last_name
       user.profile_img_url = auth.info.image
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.provider = auth.provider
       user.uid = auth.uid
   end
 end
end
