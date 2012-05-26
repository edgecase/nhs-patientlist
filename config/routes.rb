NhsPatientlist::Application.routes.draw do
  resources :patient_lists do
    collection do
      get 'current'
      get 'select_ward'
    end
  end

  root :to => "patient_lists#select_ward"
end
