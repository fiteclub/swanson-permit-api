require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:expiration) }
end
