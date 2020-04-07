require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @category = Category.new
      @Product = Product.new(
        name: "Test one",
        price: 250,
        quantity: 1,
        category: @category)
      expect(@Product).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new
      @Product = Product.new(
        name: nil,
        price: 250,
        quantity: 1,
        category: @category)
      expect(@Product).to_not be_valid
    end
    
    it "is not valid without a price" do
      @category = Category.new
      @Product = Product.new(
        name: "Test",
        price: nil,
        quantity: 1,
        category: @category)
      expect(@Product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new
      @Product = Product.new(
        name: "Test",
        price: 250,
        quantity: nil,
        category: @category)
      expect(@Product).to_not be_valid
    end
    it "is not valid without a category" do
      @category = Category.new
      @Product = Product.new(
        name: "Test",
        price: 250,
        quantity: 1,
        category: nil)
      expect(@Product).to_not be_valid
    end
    it "Error is found in the errors array" do
      @category = Category.new
      @Product = Product.new(
        name: "Test",
        price: 250,
        quantity: 1,
        category: nil)
        @Product.save
        expect(@Product.errors.full_messages).to_not be_empty
    end
  end
end
