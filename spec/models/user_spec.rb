require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,first_name_kanji,last_name_kanji,first_name_katakana,last_name_katakana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが存在しないとき登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが存在しないとき登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複しているとき登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がないとき登録できない" do
        @user.email = "abcabcabc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが存在しないとき登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationがpasswordと一致しないとき登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英字のみのとき登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが数字のみのとき登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが５文字以下のとき登録できない" do
        @user.password = "aaaa1"
        @user.password_confirmation = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角のとき登録できない" do
        @user.password = "あああああa１"
        @user.password_confirmation = "あああああa１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "first_name_kanjiが存在しないとき登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "first_name_kanjiが全角でないとき登録できない" do
        @user.first_name_kanji = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji First name Full-width characters")
      end
      it "last_name_kanjiが存在しないとき登録できない" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it "last_name_kanjiが全角でないとき登録できない" do
        @user.last_name_kanji = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji Last name Full-width characters")
      end
      it "first_name_katakanaが存在しないとき登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "first_name_katakanaが全角カナでないとき登録できない" do
        @user.first_name_katakana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana First name kana Full-width katakana characters")
      end
      it "last_name_katakanaが存在しないとき登録できない" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "last_name_katakanaが全角カナでないとき登録できない" do
        @user.last_name_katakana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana Last name kana Full-width katakana characters")
      end
      it "birthdayが存在しないとき登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
