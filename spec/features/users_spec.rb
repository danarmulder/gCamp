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

  # scenario "User edits a task" do
  #   task = Task.create!(
  #     description: "Bake cookies"
  #   )
  #
  #   visit root_path
  #   click_on "Tasks"
  #   expect(page).to have_content("Bake cookies")
  #   click_on "edit-task-#{task.id}-action"
  #   fill_in "Description", with: "Eat cookies"
  #   click_on "Update Task"
  #
  #   expect(page).to have_content("Eat cookies")
  #   expect(page).to have_no_content("Bake cookies")
  # end
  #
  # scenario "User edits a task to be complete" do
  #   task = Task.create!(
  #     description: "Bake cookies"
  #   )
  #
  #   visit root_path
  #   click_on "Tasks"
  #   expect(page).to have_content("Bake cookies")
  #   click_on "edit-task-#{task.id}-action"
  #   check('Complete')
  #   click_on "Update Task"
  #   expect(page).to have_content("Bake cookies")
  #   click_on "Tasks"
  #   click_on "Incomplete Tasks"
  #
  #   expect(page).to have_no_content("Bake cookies")
  #
  # end
  #
  # scenario "User deletes a task" do
  #   task = Task.create!(
  #     description: "Bake cookies"
  #   )
  #
  #   visit root_path
  #   click_on "Tasks"
  #   expect(page).to have_content("Bake cookies")
  #   click_on "delete-task-#{task.id}-action"
  #
  #   expect(page).to have_no_content("Bake cookies")
  # end

end
