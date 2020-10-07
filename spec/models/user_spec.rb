require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "全て記入されていれば登録できる" do
    expect(@user).to be_valid
  end
  
  it "nicknameが空だと登録できない" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが空だと登録できない" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "passwordが空だと登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "password_confirmationが空だと登録できない" do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "familynameが空だと登録できない" do
    @user.familyname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Familyname can't be blank")
  end

  it "nameが空だと登録できない" do
    @user.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end

  it "familyname_furiganaが空だと登録できない" do
    @user.familyname_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Familyname furigana can't be blank")
  end

  it "name_furiganaが空だと登録できない" do
    @user.name_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name furigana can't be blank")
  end

  it "birthdayが空だと登録できない" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end

