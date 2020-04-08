require 'rails_helper'


RSpec.feature "ProductDetails", type: :feature do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Number of items in cart updates to 1 when the add to cart button is clicked" do
    # ACT
    visit root_path
    expect(page).to have_text'My Cart (0)'

    first('button.btn.btn-primary').click
    puts page.html 

    # # VERIFY
    expect(page).to have_text'My Cart (1)'
  end
end