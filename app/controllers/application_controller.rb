class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  expose(:patient_lists) { current_user.patient_lists }
end
