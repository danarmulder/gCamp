class Task < ActiveRecord::Base

  validates :description, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def due_within_week?
    if due_date != nil
      due_date - Date.today <= 7
    end
  end

end
