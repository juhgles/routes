class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: true

  belongs_to :contact

  belongs_to :user
end
