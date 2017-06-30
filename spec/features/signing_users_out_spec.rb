require 'rails_helper'

RSpec.feature "Sign out user signed in" do

  before do
    @john = User.create!(email: "john@mail.com", password: "password")
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario "User clicks logout" do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end

end
