Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score' # as: :score ?? why is this not needed?
  # get 'score', to: 'games#score', as: :score <-- why don't we do a get request here?

end
