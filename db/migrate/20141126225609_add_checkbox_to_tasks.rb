class AddCheckboxToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :complete, :boolean, default: false, null: false
  end
end
