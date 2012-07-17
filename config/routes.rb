NhsPatientlist::Application.routes.draw do
  devise_for :users
  
  resources :users, :only => [] do
    resources :patient_lists do
    end
  end

  resources :patients, :only=>[:show, :edit, :update] do
     collection do
      get 'current'
      get 'select_ward'
    end
    member do
      get 'history'
      post 'update_risk_level'
      post 'add_to_patient_list'
      delete 'remove_from_patient_list'
    end
    resources :to_do_items do
      member do
        put 'update'
      end
    end
  end

  root :to => "patients#select_ward"
end
