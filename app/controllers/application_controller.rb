class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  expose(:own_patient_lists) { current_user.patient_lists }
  expose(:own_patient_list)
end
