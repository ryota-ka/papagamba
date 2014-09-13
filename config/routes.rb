Rails.application.routes.draw do

  root 'papas#index'

  post 'generate_pin', to: 'papas#generate_pin'
  post 'match_pin', to: 'papas#match_pin'
  get 'get_couple_by_husband', to: 'papas#get_couple_by_husband'
  get 'get_couple_by_wife', to: 'papas#get_couple_by_wife'
  post 'create_goal', to: 'papas#create_goal', as: :goals
  get 'get_goal_by_couple_id', to: 'papas#get_goal_by_couple_id'

  get 'index', to: 'papas#index'

  get 'w_top', to: 'papas#w_top'
  get 'h_top', to: 'papas#h_top'

  get 'h_1', to: 'papas#h_1'
  get 'h_2', to: 'papas#h_2'
  get 'h_3', to: 'papas#h_3'
  get 'h_4', to: 'papas#h_4'

  get 'w_1', to: 'papas#w_1'
  get 'w_2', to: 'papas#w_2'

  post 'start_running', to: 'papas#start_running'
  post 'stop_running', to: 'papas#stop_running'

end
