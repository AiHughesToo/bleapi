Rails.application.routes.draw do
  resources :listitems

  post 'validate' => 'listitems#validate'
  post 'keaphook' => 'listitems#keap_hook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
