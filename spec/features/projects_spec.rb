require 'rails_helper'

feature "Projects" do
scenario "User creates a project" do
    visit root_path
    click_on "Projects"
    click_on "New Project"
    fill_in "Name", with: "Family Tree"
    click_on "Create Project"

    expect(page).to have_content("Family Tree")
  end

scenario "User creates a project without a name first" do
  visit root_path
  click_on "Project"
  click_on "New Project"

  click_on "Create Project"
  expect(page).to have_content("1 error prohibited this project from being saved")

  fill_in "Name", with: "Holiday Preparations"

  click_on "Create Project"

  expect(page).to have_content("Holiday Preparations")
end

scenario "User edits a project" do
  project = Project.create!(
    name: "Holiday Preparations"
  )

  visit root_path
  click_on "Projects"
  expect(page).to have_content("Holiday Preparations")
  click_on "Holiday Preparations"
  click_on "Edit"
  fill_in "Name", with: "Eat cookies"
  click_on "Update Project"

  expect(page).to have_content("Eat cookies")
  expect(page).to have_no_content("Holiday Preparations")
end

scenario "User deletes a project" do
  project = Project.create!(
    name: "Holiday Preparations"
  )

  visit root_path
  click_on "Projects"
  expect(page).to have_content("Holiday Preparations")
  click_on "Holiday Preparations"
  click_on "Delete"

  expect(page).to have_no_content("Holiday Preparations")
end

end
