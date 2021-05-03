# frozen_string_literal: true

module TimeEntriesHelper
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
