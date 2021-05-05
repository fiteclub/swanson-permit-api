class Id < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :expiration, presence: true
  validates :id_number, presence: true, uniqueness: true
  validates :state, presence: true, length: { maximum: 2 },
                    format: { with: VALID_STATE_REGEX }
end
