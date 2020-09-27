Rails.application.routes.draw do
  root 'static#home'
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get '/expenses' => 'expenses#index'
  get '/expenses/:id' => 'expenses#show'
  post '/expenses' => 'expenses#create'
  get '/incomes' => 'incomes#index'
  get '/incomes/:id' => 'incomes#show'
  post '/incomes' => 'incomes#create'
end
