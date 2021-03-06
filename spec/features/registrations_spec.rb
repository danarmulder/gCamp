require 'rails_helper'

feature "Sign-Up" do
  scenario "User signs up" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Robert"
    fill_in "Last name", with: "Downey Jr."
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    click_on "Sign up"

    expect(page).to have_content("Robert Downey Jr.")
    expect(page).to have_content("Sign Out")
  end

  scenario "User signs up with non-mathing passwords and is not permitted" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Robert"
    fill_in "Last name", with: "Downey Jr."
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "123"
    click_on "Sign up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "User signs up with an email thats take and is not permitted" do
    user = User.create!(
      first_name: "Barbara",
      last_name: "Streisand",
      email: "barbarastreisand@aol.com",
      password: "1234",
      password_confirmation: "1234"
    )

    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Barbara"
    fill_in "Last name", with: "Streisand"
    fill_in "Email", with: "barbarastreisand@aol.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "123"
    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end

end
