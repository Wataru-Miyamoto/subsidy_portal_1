Rails.application.routes.draw do

  root 'static_pages#top'
  get  '/signup', to: 'users#new'

  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'admin_post'
      post 'admin_pref_topic_post'
      post 'admin_city_topic_post'
    end
    resources :drafts
  end

  resources :gov_topics

  resources :prefs do
    member do
      get 'admin_index'
    end
    collection do
      get 'cities_select' # /prefs/cities_select
    end
    collection {post :import}
      resources :pref_topics
      resources :cities do
        member do
          get 'admin_index'
        end
        collection {post :import}
        resources :city_topics
      end
  end
  #get 'city_topics/new'
  #get 'city_topics/edit'
  #get 'city_topics/show'
  #get 'city_topics/index'
  #get 'pref_topics/new'
  #get 'pref_topics/edit'
  #get 'pref_topics/show'
  #get 'pref_topics/index'
  #get 'prefs/index'
  #get 'prefs/show'
  #get 'gov_topics/new'
  #get 'gov_topics/edit'
  #get 'gov_topics/show'
  #get 'gov_topics/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
