NhsPatientlist::Application.routes.draw do
  resources :patient_lists, :only=>[] do
    collection do
      get 'current'
      get 'select_ward'
    end
  end

  resources :patients, :only=>[:edit, :update] do
    member do
      get 'history'
    end
    resources :to_do_items do
      member do
        post 'add_event'
      end
    end
  end

  root :to => "patient_lists#select_ward"
end
