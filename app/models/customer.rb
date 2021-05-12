class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diys, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # ログイン時の空白を許可しない
  validates :nickname, :last_name, :first_name, :last_kana_name, :first_kana_name, presence: true

  # サインイン時のカタカナ入力に関するバリデーション
  validates :last_kana_name, :first_kana_name,
            format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }

  # ユーザーステータスの二択
  enum is_valid: { 有効: false, 退会: true }

end
