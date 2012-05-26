NhsPatientlist::Application.routes.draw do
  resource :admissions
  root :to=>"admissions#index"
end
