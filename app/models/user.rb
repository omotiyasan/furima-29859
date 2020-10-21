class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  end

  with_options presence: true, format: { with:/[ぁ-んァ-ン一-龥]/} do
    validates :name
    validates :familyname
  end

  with_options presence: true, format: { with:/[ァ-ン]/} do
    validates :name_furigana
    validates :familyname_furigana
  end
end
