Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		get '/item/:query', :to => "item#getItem"
  		post '/item', :to => "item#addItem"
  	end
  end
end
