class Recommendation < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :expiration, presence: true
  validates :issuer, presence: true
  validates :state, presence: true, length: { maximum: 2 },
                    format: { with: VALID_STATE_REGEX }
end
