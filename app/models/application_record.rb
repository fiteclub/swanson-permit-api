class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  VALID_STATE_REGEX = /\b([A-Z]{2})\b/ 

  def expired?
    return true if Date.current > expiration
  end
end
