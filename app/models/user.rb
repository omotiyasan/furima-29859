class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buys

  with_options presence: true do
    validates :name, format: { with:/[ぁ-んァ-ン一-龥]/}
    validates :nickname
    validates :familyname, format: { with:/[ぁ-んァ-ン一-龥]/}
    validates :name_furigana, format: { with:/[ァ-ン]/}
    validates :familyname_furigana, format: { with:/[ァ-ン]/}
    validates :birthday
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  end
end
