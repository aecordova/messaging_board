# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(5).is_at_most(30) }
  it { is_expected.to have_many(:posts).dependent(:destroy) }
end
