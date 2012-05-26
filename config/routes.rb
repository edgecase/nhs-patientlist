NhsPatientlist::Application.routes.draw do

  match "/patient_lists/current" => "patient_lists#current"

  resources :patient_lists do
    collection do
      get 'current'
      get 'select_ward'
    end
  end


end
