Rails.application.routes.draw do
  root 'shorts#home'
  post '/shorts' => 'shorts#create'
  get '/s/:short' => 'shorts#redirect'
end
