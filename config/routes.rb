# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'time_entries#index'

  resources :time_entries, only: %i[index edit update show]
  get '/clock_in', to: 'time_entries#create'
  get '/clock_out', to: 'time_entries#clock_out'
end
