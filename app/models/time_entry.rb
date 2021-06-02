# frozen_string_literal: true

class TimeEntry < ApplicationRecord
  belongs_to :user
  validates_datetime :clock_out, on: :update, after: :created_at, after_message: 'must come after clock in'

  scope :today_entries, -> { where(created_at: Time.current.all_day) }
  scope :entries_by_day, ->(day) { where(created_at: Time.parse(day).all_day).order(:id) }

  def time_on_stop
    if clock_out.present?
      time_in = created_at
      time_out = clock_out

      total_time = time_out - time_in 

      hrs = total_time / (60 * 60)
      mins = (total_time / 60) % 60

      format('%02d:%02d', hrs, mins)
    end
  end

  def total_entries_time(entries)
    total = 0
    entries.each do |time_entry|
      next unless time_entry.clock_out

      time_in = time_entry.created_at
      time_out = time_entry.clock_out
      total_time = time_out - time_in
      total += total_time
    end
    hrs = total / (60 * 60)
    mins = (total / 60) % 60

    format('%02d:%02d', hrs, mins)
  end
end
