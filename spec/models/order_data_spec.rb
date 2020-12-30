require 'rails_helper'

RSpec.describe OrderData, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_data = FactoryBot.build(:order_data, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品の購入機能' do
    context '購入がうまくいくとき' do
      it "postal_code, prefecture_id, municiparity, house_num, building_name, phone_num, token, order_id, item_id, user_idがあるとき購入できる" do
        expect(@order_data).to be_valid
      end
      it "building_nameがなくても購入できる" do
        @order_data.building_name = ""
        expect(@order_data).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "postal_codeが存在しないとき購入できない" do
        @order_data.postal_code = ""
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが'-'を含まないとき購入できない" do
        @order_data.postal_code = "1234567"
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが全角のとき購入できない" do
        @order_data.postal_code = "１２３-４５６７"
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが存在しないとき購入できない" do
        @order_data.prefecture_id = ""
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1のとき購入できない" do
        @order_data.prefecture_id = 1
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "municipalityが存在しないとき購入できない" do
        @order_data.municipality = ""
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Municipality can't be blank")
      end
      it "house_numが存在しないとき購入できない" do
        @order_data.house_num = ""
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("House num can't be blank")
      end
      it "phone_numが存在しないとき購入できない" do
        @order_data.phone_num = ""
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Phone num can't be blank")
      end
      it "phone_numが12文字以上のとき購入できない" do
        @order_data.phone_num = "000000000000"
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Phone num Too long")
      end
      it "phone_numが半角数字以外のとき購入できない" do
        @order_data.phone_num = "１１１１１１１１１１１"
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Phone num Half-width number")
      end
      it "tokenが存在しないとき購入できない" do
        @order_data.token = nil
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが存在しないとき購入できない" do
        @order_data.user_id = nil
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが存在しないとき購入できない" do
        @order_data.item_id = nil
        @order_data.valid?
        expect(@order_data.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
