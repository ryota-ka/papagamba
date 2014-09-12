Rails.application.routes.draw do

  post 'generate_pin', to: 'papas#generate_pin'
  post 'match_pin', to: 'papas#match_pin'
  get 'get_couple_by_husband', to: 'papas#get_couple_by_husband'
  get 'get_couple_by_wife', to: 'papas#get_couple_by_wife'
  post 'create_goal', to: 'papas#create_goal'
  get 'get_goal_by_couple_id', to: 'papas#get_goal_by_couple_id'

end
