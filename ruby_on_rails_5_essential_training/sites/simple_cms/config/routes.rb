Rails.application.routes.draw do
  get 'example/view'
  root 'demo#index'
  get 'demo/index'
  # default route
  # may be removed in future versions
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
