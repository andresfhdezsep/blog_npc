class User < ApplicationRecord
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 10.megabytes

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :articles

  validates_uniqueness_of :username
  validates :username, presence: true
end
