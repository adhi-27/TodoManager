class Todo < ApplicationRecord
  belongs_to :user

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.completed
    where(completed: true)
  end
end
