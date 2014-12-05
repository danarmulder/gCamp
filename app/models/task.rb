class Task < ActiveRecord::Base

  def due_within_week?
    if due_date != nil
      due_date.day - 7 <= 0
    end
  end

end
