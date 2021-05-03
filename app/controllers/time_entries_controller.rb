# frozen_string_literal: true

class TimeEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_entry, only: %i[edit update show]
  before_action :time_entry_params, only: :update

  def index
    @time_entries = current_user.time_entries
    @total_time = helpers.total_entries_time(@time_entries)
  end

  def create
    @time_entry = TimeEntry.new
    @time_entry.user_id = current_user.id
    if @time_entry.save
      flash[:notice] = 'Time Entry Created!'
      redirect_to time_entries_path
    else
      render :new
    end
  end

  def clock_out
    redirect_to time_entries_path if current_user.time_entries.last.update(clock_out: Time.current)
  end

  def edit
    @time_entry
  end

  def update
    if @time_entry.update(time_entry_params)
      flash[:notice] = 'Time Updated'
      redirect_to time_entries_path
    else
      render :edit
    end
  end

  def show
    @time_entry
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:created_at, :clock_out)
  end

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end
end
