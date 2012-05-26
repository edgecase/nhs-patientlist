NhsPatientlist::Application.routes.draw do
  resource :admissions
  root :to=>"admissions#index"

  match "/patient_lists/current" => "patient_lists#current"
end
