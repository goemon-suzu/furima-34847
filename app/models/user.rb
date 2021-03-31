class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#has_many :items, dependent: :destroy
#has_many :orders, dependent: :destroy

    with_options presence: true do
      validates :nickname
      validates :birthday

      with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]/} do
        validates :last_name
        validates :first_name
      end

      with_options format: { with: /\A[ァ-ヶー－]+\z/} do
        validates :last_name_kana
        validates :first_name_kana
      end

      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
      with_options format: { with: PASSWORD_REGEX } do
        validates :password
        validates :password_confirmation
      end

    end
end
