class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 42 }
  validates :dob, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :ident_state, presence: true, length: { maximum: 2 },
                          format: { with: VALID_STATE_REGEX }

  def show_ident(user)
    if user.ident_expired?
      { identification: 'expired' }
    else
      { identification:
        {
          id_number: user.ident_num,
          id_state: user.ident_state,
          id_expiration: user.ident_expir,
          id_image: user.ident_img
        } }
    end
  end

  def ident_expired?
    check_expired(ident_expir)
  end

  def recom_expired?
    check_expired(recom_expir)
  end

  def check_expired(date)
    return Date.current > date
  end
end
