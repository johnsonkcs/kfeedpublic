class User < ActiveRecord::Base


  has_many :feedings, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  has_many :feeders, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :profile_pic, ProfilepicUploader

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.remote_profile_pic_url = auth.info.image.gsub('http://','https://')
        user.password = Devise.friendly_token[0,20]
      end
  end
end
