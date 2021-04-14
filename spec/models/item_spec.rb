require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録できるとき' do
      it '全ての項目が正しく入力されてあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像をアップロードしてください。')
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'category_idが０では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください。')
      end

      it '商品の状態のidが０では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください。')
      end

      it '配送料の負担のidが０では登録できない' do
        @item.delivery_setting_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください。')
      end

      it '発送元の地域のidが０では登録できない' do
        @item.shipment_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください。')
      end

      it '発送までの日数のidが０では登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください。')
      end

      it '価格についての情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください', '販売価格は不正な値です', '販売価格は数値で入力してください')
      end

      it '価格の範囲が¥300~¥9,999,999以外では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end

      it '価格の範囲が¥300~¥9,999,999以外では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999より小さい値にしてください')
      end

      it '価格は全角数字では登録できない' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it 'priceは半角英数混合では登録できない' do
        @item.price = '1as'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it '販売価格は半角英語では登録できない' do
        @item.price = 'asd'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end
