# frozen_string_literal: true

class TimeEntry < ApplicationRecord
  belongs_to :task
end
