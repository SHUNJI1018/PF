require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションテスト' do
    subject { customer.valid? }
    let!(:other_customer) { FactoryBot.create(:customer) }
    let(:customer) { FactoryBot.create(:customer) }

    context 'nicknameカラム' do
      it '空欄でない' do
        # id一致
        customer.nickname = ''
        is_expected.to eq false
      end
      it '一意性であること' do
        customer.nickname = other_customer.nickname
        is_expected.to eq false
      end
      it '文字数10字以下である => true' do
        customer.nickname = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '文字数11字以上である => false' do
        customer.nickname = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
    end

    context 'last_nameカラム' do
      it '空欄でない' do
        customer.last_name = ''
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      it '空欄でない' do
        customer.last_name = ''
        is_expected.to eq false
      end
    end

    context 'last_kana_nameカラム' do
      it '空欄でない' do
        customer.last_kana_name = ''
        is_expected.to eq false
      end
    end

    context 'first_kana_nameカラム' do
      it '空欄でない' do
        customer.first_kana_name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションテスト' do
    context 'Diyモデルとの関係' do
      it '1:N' do
        # 属性一致
        expect(Customer.reflect_on_association(:diys).macro).to eq :has_many
      end
    end

    context 'DiyCommentモデルとの関係' do
      it '1:N' do
        expect(Customer.reflect_on_association(:diy_comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:N' do
        expect(Customer.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
