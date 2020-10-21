require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  it "全て記載されていれば保存できる" do
    expect(@user_order).to be_valid
  end

  it "tokenが空だと登録できない" do
    @user_order.token = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Token can't be blank")
  end

  it "postal_codeが空だと登録できない" do
    @user_order.postal_code = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
  end

  it "postal_codeにハイフンがないと登録できない" do
    @user_order.postal_code = "1234567"
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Postal code is invalid")
  end

  it "prefectureが空だと登録できない" do
    @user_order.prefecture_id = 1
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "municipalityが空だと登録できない" do
    @user_order.municipality = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
  end

  it "building_nameが空でも登録できる" do
    @user_order.building_name = nil
    expect(@user_order).to be_valid
  end

  it "blockが空だと登録できない" do
    @user_order.block = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Block can't be blank")
  end

  it "phoneが空だと登録できない" do
    @user_order.phone = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
  end

  it "phoneがハイフンがあると登録できない" do
    @user_order.phone = "090-1234-1234"
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone is invalid")
  end

  it "phoneが11桁以上あると登録できない" do
    @user_order.phone = "000000000000"
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone is invalid")
  end

end
