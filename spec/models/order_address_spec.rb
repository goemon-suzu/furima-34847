require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 2
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全て正常' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存ができる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '紐づくuserがないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userを入力してください')
      end
      it '紐づく商品情報がないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end
      it '郵便番号が必須であること' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '都道府県が必須であること' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください。')
      end
      it '市区町村が必須であること' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it '番地が必須であること' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it '電話番号がないと登録出来ない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください', '電話番号は不正な値です')
      end
      it '郵便番号にはハイフンが必要であること' do
        @order_address.postal_code = '1230567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '電話番号は11桁以内であること' do
        @order_address.phone_number = '123056788888888'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号は英数混合では登録できないこと' do
        @order_address.phone_number = '090abcd1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '都道府県が０以外でないと登録出来ない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください。')
      end
      it '電話番号にはハイフンがあったら登録出来ないこと' do
        @order_address.phone_number = '123-4567-8999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'PAYJP_PUBLIC_KEYがないと登録出来ない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tokenを入力してください')
      end

    end
  end
end
