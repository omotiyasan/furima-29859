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

  it 'familynameが全角日本語でないと保存できないこと' do
    @user.familyname = "tanaka"
    @user.valid?
    expect(@user.errors.full_messages).to include("Familyname is invalid")
  end

  it "nameが空だと登録できない" do
    @user.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end

  it 'nameが全角日本語でないと保存できないこと' do
    @user.name = "tarou"
    @user.valid?
    expect(@user.errors.full_messages).to include("Name is invalid")
  end

  it "familyname_furiganaが空だと登録できない" do
    @user.familyname_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Familyname furigana can't be blank")
  end

  it 'familyname_furiganaが全角カナでないと保存できないこと' do
    @user.familyname_furigana = "tanaka"
    @user.valid?
    expect(@user.errors.full_messages).to include("Familyname furigana is invalid")
  end

  it "name_furiganaが空だと登録できない" do
    @user.name_furigana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Name furigana can't be blank")
  end

  it "name_furiganaが全角カナでないと保存できないこと" do
    @user.name_furigana = "tanaka"
    @user.valid?
    expect(@user.errors.full_messages).to include("Name furigana is invalid")
  end

  it "birthdayが空だと登録できない" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it "passwordが6文字以上であれば登録できること" do
    @user.password = "ageage12"
    @user.password_confirmation = "ageage12"
    expect(@user).to be_valid
  end

  it "passwordが5文字以下であれば登録できないこと" do
    @user.password = "age12"
    @user.password_confirmation = "age12"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "passwordとpassword_confirmationが不一致では登録できないこと" do
    @user.password = "123456"
    @user.password_confirmation = "1234567"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "passwordは半角英数字混合でないと登録できない" do
    @user.password = "ageage"
    @user.password_confirmation = "ageage"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "重複したemailが存在する場合登録できないこと" do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "emailに@がないと登録できないこと" do
    @user.password = "hogegmail.jp"
    @user.password_confirmation = "hogegmail.jp"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

end

