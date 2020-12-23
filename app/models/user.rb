class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "Password Include both letters and numbers" }
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
  validates :last_name_kanji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"}
  validates :first_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
  validates :last_name_katakana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
  validates :birthday, presence: true
  
end
