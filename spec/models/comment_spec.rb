require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(255) }
  it { is_expected.to belong_to(:author).class_name('User') }
end
