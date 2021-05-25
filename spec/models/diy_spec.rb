require 'rails_helper'

RSpec.describe Diy, 'Diyモデルのテスト', type: :model do
  describe 'バリデーションテスト' do
    subject { diy.valid? }
    let(:customer) { FactoryBot.create(:customer) }
    let!(:diy) { FactoryBot.create(:diy) }

    context 'diy_nameカラム' do
      it '空欄でない' do
        diy.diy_name = ''
        # id一致
        is_expected.to eq false
      end
    end

    context 'explanationカラム' do
      it '空欄でない' do
        diy.explanation = ''
        is_expected.to eq false
      end
    end

    context 'image_idカラム' do
      it '空欄でない' do
        diy.image_id = ''
        is_expected.to eq false
      end
    end

    context 'genre_idカラム' do
      it '空欄でない' do
        diy.genre_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1' do
        # 属性一致
        expect(Diy.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Genreモデルとの関係' do
      it 'N:1' do
        expect(Diy.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end

    context 'DiyCommentモデルとの関係' do
      it '1:N' do
        expect(Diy.reflect_on_association(:diy_comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:N' do
        expect(Diy.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
