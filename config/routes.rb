NhsPatientlist::Application.routes.draw do
  devise_for :users

  resources :users, only: [] do
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
    end
    resources :to_do_items do
      member do
        put 'update'
      end
    end
  end


  match 'memberships' => 'memberships#create', via: :post
  match 'memberships/:patient_id/:patient_list_id' => 'memberships#destroy', via: :delete

  root :to => "patients#select_ward"
end
