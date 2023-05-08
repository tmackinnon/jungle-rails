require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    before do
      @category = Category.new(name: "Flowers")
      @product = Product.new(name: "Rose", price_cents: 5000, quantity: 1, category: @category)
    end

    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end
  
    it "is not valid without a name" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty

    end

    it "is not valid without a price" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "is not valid without a category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

  end
end
