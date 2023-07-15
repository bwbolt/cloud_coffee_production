Rails.application.routes.draw do
  resources :blend_logs
  get 'blend_log/create'
  get 'blend_log/show'
  get 'blend_log/update'
  get 'blend_log/destroy'
  get 'blend_log/new'
  get 'blend_log/create'
  get 'blend_log/show'
  get 'blend_log/update'
  get 'blend_log/destroy'
  resources :blends


  get 'download_blends', to: 'blends#download_csv'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'detailed_inventory', to: 'user_lots#detailed'

  delete 'logout', to: 'sessions#destroy'

  root to: 'main#index'

  get 'coffee_market', to: 'markets#index'

  resources :users, only: [] do
    get 'lots_to_csv', to: 'user_lots#download_csv'
    get 'logs_to_csv', to: 'user_logs#download_csv'
    
    resources :lots, controller: 'user_lots' do
     
      patch 'mark_arrived', to: 'user_lots'
      get 'mark_removed', to: 'user_lots'
      patch 'edit', to: 'user_lots'
      patch 'update', to: 'user_lots'
    end
    resources :logs, controller: 'user_logs' do
      patch 'weight_out', to: 'user_logs'
      patch 'destroy', to: 'user_logs'
    end

    resources :current_products, controller: 'user_current_products' do
      
    end
    get 'completed_orders', to: 'user_order_requests#completed'
    get 'paid_orders', to: 'user_order_requests#paid'
    resources :order_requests, controller: 'user_order_requests' do
      
      patch 'mark_completed', to: 'user_order_requests'
      patch 'mark_paid', to: 'user_order_requests'
      delete 'delete', to: 'user_order_requests'
      resources :order_pieces, controller: 'user_order_pieces'
    end
  end
end
