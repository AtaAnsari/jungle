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

  scenario "They see product detail page after clicking on a product image" do
    # ACT
    visit root_path
    expect(page).to_not have_css '.products-show'

    first(:xpath, "//a[@href='/products/1']").click
    puts page.html 

    # # VERIFY
    expect(page).to have_css '.products-show'
  end
end
