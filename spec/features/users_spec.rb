require 'rails_helper'

feature "Users" do
  scenario "User creates a User" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "First name", with: "Robert"
    fill_in "Last name", with: "Downey Jr."
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    click_on "Create User"

    expect(page).to have_content("Robert Downey Jr.")
    expect(page).to have_content("sherlockholmes@yahoo.com")
  end

  scenario "User must enter in first name" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "Last name", with: "Downey Jr."
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    click_on "Create User"

    expect(page).to have_content("First name can't be blank")
    fill_in "First name", with: "Robert"
    click_on "Create User"

    expect(page).to have_content("Robert Downey Jr.")
    expect(page).to have_content("sherlockholmes@yahoo.com")
  end

  scenario "User must enter in last name" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "First name", with: "Robert"
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    click_on "Create User"

    expect(page).to have_content("Last name can't be blank")
    fill_in "Last name", with: "Downey Jr."
    click_on "Create User"

    expect(page).to have_content("Robert Downey Jr.")
    expect(page).to have_content("sherlockholmes@yahoo.com")
  end

  scenario "User must enter in an email" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "First name", with: "Robert"
    fill_in "Last name", with: "Downey Jr."
    click_on "Create User"

    expect(page).to have_content("Email can't be blank")
    fill_in "Email", with: "sherlockholmes@yahoo.com"
    click_on "Create User"

    expect(page).to have_content("Robert Downey Jr.")
    expect(page).to have_content("sherlockholmes@yahoo.com")
  end

  scenario "User can't enter the same email as another user" do
    user = User.create!(
      first_name: "Barbara",
      last_name: "Streisand",
      email: "barbarastreisand@aol.com"
    )

    visit root_path
    click_on "Users"
    expect(page).to have_content("Barbara Streisand")
    click_on "New User"
    fill_in "First name", with: "Barbara"
    fill_in "Last name", with: "Walters"
    fill_in "Email", with: "barbarastreisand@aol.com"
    click_on "Create User"

    expect(page).to have_content("Email has already been taken")
    fill_in "Email", with: "sixtyminutes@gmail.com"
    click_on "Create User"

    expect(page).to have_content("Barbara Walters")
  end

  scenario "User edits a user" do
    user = User.create!(
      first_name: "Barbara",
      last_name: "Streisand",
      email: "barbarastreisand@aol.com"
    )

    visit root_path
    click_on "Users"
    expect(page).to have_content("Barbara Streisand")
    click_on "edit-user-#{user.id}-action"
    fill_in "Last name", with: "Walters"
    click_on "Update User"

    expect(page).to have_content("Barbara Walters")
    expect(page).to have_no_content("Barbara Streisand")
  end

end
