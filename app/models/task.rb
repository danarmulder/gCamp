class Task < ActiveRecord::Base

  def due_within_week?
    if due_date != nil
      due_date - Date.today <= 7
    end
  end

end
