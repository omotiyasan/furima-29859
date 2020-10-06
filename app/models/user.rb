class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buys

  validates :name, presence: true, format: { with:/[ぁ-んァ-ン一-龥]/}
  validates :nickname, presence: true
  validates :familyname, presence: true, format: { with:/[ぁ-んァ-ン一-龥]/}
  validates :name_furigana, presence: true, format: { with:/[ァ-ン]/}
  validates :familyname_furigana, presence: true, format: { with:/[ァ-ン]/}
  validates :birthday, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end