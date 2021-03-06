class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name_katakana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :last_name_katakana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birthday
  end
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "Include both letters and numbers" }
  
  has_many :items
  has_many :orders
end
