require 'rails_helper'

feature "Tasks" do
  scenario "User creates a task" do

    visit root_path
    click_on "Tasks"
    click_on "New Task"
    fill_in "Description", with: "Make PB&J"
    click_on "Create Task"

    expect(page).to have_content("Make PB&J")
  end

  scenario "User creates a task without a description first" do
    visit root_path
    click_on "Tasks"
    click_on "New Task"

    click_on "Create Task"
    expect(page).to have_content("1 error prohibited this task")

    fill_in "Description", with: "Make soup"

    click_on "Create Task"

    expect(page).to have_content("Make soup")
  end

  scenario "User edits a task" do
    task = Task.create!(
      description: "Bake cookies"
    )

    visit root_path
    click_on "Tasks"
    expect(page).to have_content("Bake cookies")
    click_on "edit-task-#{task.id}-action"
    fill_in "Description", with: "Eat cookies"
    click_on "Update Task"

    expect(page).to have_content("Eat cookies")
    expect(page).to have_no_content("Bake cookies")
  end

  scenario "User edits a task to be complete and
    does not show in incomplete list" do
    task = Task.create!(
      description: "Bake cookies"
    )

    visit root_path
    click_on "Tasks"
    expect(page).to have_content("Bake cookies")
    click_on "edit-task-#{task.id}-action"
    check('Complete')
    click_on "Update Task"
    expect(page).to have_content("Bake cookies")
    click_on "Tasks"
    click_on "Incomplete Tasks"

    expect(page).to have_no_content("Bake cookies")

  end

  scenario "User deletes a task" do
    task = Task.create!(
      description: "Bake cookies"
    )

    visit root_path
    click_on "Tasks"
    expect(page).to have_content("Bake cookies")
    click_on "delete-task-#{task.id}-action"

    expect(page).to have_no_content("Bake cookies")
  end

end
