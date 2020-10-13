require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  it "ログインしているユーザーだけが出品ページへ遷移できる" do
    expect(@product).to be_valid
  end
  it "画像は１枚必須である" do
    @product.image = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Image can't be blank")
  end
  it "商品名が必須である" do
    @product.name = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end
  it "商品の説明が必須である" do
    @product.description = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Description can't be blank")
  end
  it "カテゴリーの情報が必須である" do
    @product.category_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Category must be other than 1")
  end
  it "商品の状態についての情報が必須である" do
    @product.condition_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Condition must be other than 1")
  end
  it "配送料の負担についての情報が必須である" do
    @product.shippingcharge_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Shippingcharge must be other than 1")
  end
  it "発送元の地域についての情報が必須である" do
    @product.salesarea_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Salesarea must be other than 1")
  end
  it "発送までの日数についての情報が必須である" do
    @product.daystoship_id = 1
    @product.valid?
    expect(@product.errors.full_messages).to include("Daystoship must be other than 1")
  end
  it "価格についての情報が必須である" do
    @product.money = nil
    @product.valid?
    expect(@product.errors.full_messages).to include("Money can't be blank")
  end
  it "価格の範囲が¥300~¥9,999,999の間である" do
    @product.money = 299
    @product.valid?
    expect(@product.errors.full_messages).to include("Money is not included in the list")
  end
  it "販売価格は半角数字のみ入力可能である" do
    @product.money = "５０００"
    @product.valid?
    expect(@product.errors.full_messages).to include("Money is not a number", "Money is not included in the list")
  end
end
