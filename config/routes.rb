Rails.application.routes.draw do

  resources :fechamento_caixas
  resources :despesas do
    collection do
      get :gerar_saida
    end
  end

  resources :fornecedors
  resources :eventos do
    collection do
      get :google_calendar,:redirect, :callback
    end
  end

  devise_for :users

  resources :fin_conta
  resources :fin_movimentos do
    collection do
       post :faturamento
        get :fluxo_caixa,:realizar_movimento, :graficos, :verificar_saldo
    end
  end
  resources :contrato_produtos
  resources :produtos
  resources :contratos do
   collection do
      get :print, :atualiza_vl_negociado, :lista_produtos, :gerar_faturamento,
          :faturamento, :lista_entradas
      end
   end
  resources :clientes
    #root 'public#index'
    #get 'show/:permalink', :to => 'public#show'
    #root "demo#index"
    root 'app#index'


    # get "/auth/google-oauth2/callback" => "sessions#create"
    #get "/auth/:provider/callback" => "sessions#create"
    #get 'admin', :to => "acess#index"
    #get 'demo/index'
    match ':controller(/:action(/:id))', :via => [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
