Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		get '/item/:query', :to => "item#getOne"
  		post '/item', :to => "item#add"

  		post '/list', :to => "market_list#add"
  		get '/list', :to => "market_list#get_items"
  		delete '/list/:item_id', :to => "market_list#delete_item"
  	end
  end
end
