class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :project_id, presence: true

  validates :user_id, :uniqueness => {:scope => [:project_id]}
end
