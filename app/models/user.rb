class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 42 }
  validates :dob, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :ident_state, length: { maximum: 2 },
                          format: { with: VALID_STATE_REGEX }

  def identification_expired?
    check_expired(ident_expir)
  end

  def recommendation_expired?
    check_expired(recom_expir)
  end

  def check_expired(date)
    Date.current > date
  end
end
