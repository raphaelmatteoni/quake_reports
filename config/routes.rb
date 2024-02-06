# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'matches#home'
  get '/matches/general_report', to: 'matches#general_report'
  get '/matches/death_cause_report', to: 'matches#death_cause_report'
end
