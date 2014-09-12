Rails.application.routes.draw do

  post 'generate_pin', to: 'papas#generate_pin'
  post 'match_pin', to: 'papas#match_pin'

end
