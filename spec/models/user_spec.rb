# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tasks).dependent(:destroy) }
    it { should have_many(:time_entries).through(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
  end
end
