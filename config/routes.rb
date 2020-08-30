Rails.application.routes.draw do

  scope ":locale", locale: /pl|en/ do
    devise_for :users

    get   '/orders/prepare',  to: 'orders#prepare'
    get   '/orders/send_message', to: 'orders#prepare'
    post  '/orders/send_message', to: 'orders#send_message'

    resources :cart, only: :index
    post  '/cart_add',     to: 'cart#cart_add_to'
    post  '/cart_remove',  to: 'cart#cart_remove_from'
    get   '/cart_empty',   to: 'cart#cart_empty'

    get '/search', to: 'products#index'
    resources :products do
      resources :volumes
    end
  
    get '/kontakt', to: 'kontakt#kontakt', as: :kontakt

    scope '/aerozole' do
      get '/nasze-aerozole',    to: 'aerozole#nasze_aerozole', as: :nasze_aerozole
      get '/aerozole-w-zyciu',  to: 'aerozole#aerozole_w_zyciu', as: :aerozole_w_zyciu
      get '/proces-produkcji',  to: 'aerozole#proces_produkcji', as: :proces_produkcji
    end

    scope '/firma' do
      get '/o-nas',     to: 'firma#o_nas', as: :o_nas
      get '/gwarancja', to: 'firma#gwarancja', as: :gwarancja
      get '/ekologia',  to: 'firma#ekologia', as: :ekologia
    end

    get '/', to: "firma#o_nas"

  end

  root to: 'firma#o_nas', locale: 'pl'

end
