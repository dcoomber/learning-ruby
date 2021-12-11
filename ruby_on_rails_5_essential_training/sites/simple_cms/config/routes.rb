Rails.application.routes.draw do
  # default route
  # may be removed in future versions
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'example/view'
  root 'demo#index'
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
end
