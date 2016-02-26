class Application < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 50 }
  validates :APIkey, presence: true, length: { maximum: 50 }
end
