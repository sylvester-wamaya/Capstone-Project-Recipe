require 'rails_helper'

RSpec.describe "Food index page", type: :feature do
  let(:user) { User.create(name: "test", email: "test@gmail.com", password: "password") }

  before :each do
    sign_in user
  end

  it "displays the link to create new food" do
    visit foods_path
    expect(page).to have_content("New Food")
  end

  it "should create and show a food" do
    # create a food
    visit foods_path
    click_link "New Food"
    fill_in "Name of food", with: "test food"
    fill_in "Measurement unit", with: "test unit"
    fill_in "Price", with: "1.0"
    fill_in "Quantity", with: "1"
    click_button "Create Food"

    # check and see if the food is created properly
    expect(page).to have_content("test food")
    expect(page).to have_content("test unit")
    expect(page).to have_content("1.0")
    expect(page).to have_content("1")
  end

  it "should edit and show a food" do
    # create a food
    visit foods_path
    click_link "New Food"
    fill_in "Name of food", with: "test food"
    fill_in "Measurement unit", with: "test unit"
    fill_in "Price", with: "1.0"
    fill_in "Quantity", with: "1"
    click_button "Create Food"

    # click on the food name
    click_link "test food"
    # click on the edit link
    click_link "Edit"

    # edit the food
    fill_in "Name", with: "test food edited"
    fill_in "Measurement unit", with: "test unit edited"
    fill_in "Price", with: "2.0"
    fill_in "Quantity", with: "2"
    click_button "Update"

    # check and see if the food is updated properly
    expect(page).to have_content("test food edited")
    expect(page).to have_content("test unit edited")
    expect(page).to have_content("2.0")
    expect(page).to have_content("2")
  end

  it "should delete a food" do
    # create a food
    visit foods_path
    click_link "New Food"
    fill_in "Name of food", with: "test food"
    fill_in "Measurement unit", with: "test unit"
    fill_in "Price", with: "1.0"
    fill_in "Quantity", with: "1"
    click_button "Create Food"

    # click on the food name
    click_link "test food"
    # click on the delete button
    click_button "Delete"

    # check and see if the food is deleted properly
    expect(page).to have_no_content("test food")
  end
end