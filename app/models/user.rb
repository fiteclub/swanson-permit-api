class User < ApplicationRecord
  mount_uploader :ident_img, UserImageUploader
  mount_uploader :permit_img, UserImageUploader
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 42 }
  # validates :dob, presence: true
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX }
  # validates :ident_state, length: { maximum: 2 },
  #                         format: { with: VALID_STATE_REGEX }

  def expired?
    Date.current > ident_expir || Date.current > permit_expir
  end

  def status
    if ident_expir.nil? || permit_expir.nil?
      'INVALID'
    elsif expired?
      'EXPIRED'
    else
      'OK'
    end
  end

  # Voodoo magic from stackoverflow:
  # https://stackoverflow.com/questions/5240973/carrierwave-with-activeresource
  def image_as_base64=(image_source)
    tmpfile = Tempfile.new(['user', '.jpg'], Rails.root.join('tmp'), :encoding => 'BINARY')
    begin
      tmpfile.write(Base64.decode64(image_source.force_encoding('BINARY')))
      file = CarrierWave::SanitizedFile.new(tmpfile)
      file.content_type = 'image/jpg'
      self.image = file
    ensure
      tmpfile.close!
    end
  end
end
