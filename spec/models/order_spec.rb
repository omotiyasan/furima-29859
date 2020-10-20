require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user_order = FactoryBot.build(:user_oreder)
  end

  it "priceとtokenがあれば保存できる" do
    expect(@user_order).to be_valid
  end

  it "priceが空だと登録できない" do
    @order.price = nill
    @order.valid?
    binding.pry
    expect(@order.errors.full_messages).to include()
  end

  it "tokenが空だと登録できない" do
    @order.price = nill
    @order.valid?
    binding.pry
    expect(@order.errors.full_messages).to include()
  end
end
