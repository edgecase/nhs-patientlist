NhsPatientlist::Application.routes.draw do
  devise_for :users
  
  resources :users, :only => [] do
    resources :patient_lists
  end

  resources :patients, :only=>[:edit, :update] do
     collection do
      get 'current'
      get 'select_ward'
    end
    member do
      get 'history'
      post 'update_risk_level'
    end
    resources :to_do_items do
      member do
        put 'update'
      end
    end
  end

  root :to => "patients#select_ward"
end
