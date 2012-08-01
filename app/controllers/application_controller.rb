class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  # patient_lists for sidebar explicitly exposes only the persisted records
  # to prevent problem trying to link_to nonexistent list in 'new'
  expose(:patient_lists) { current_user.patient_lists.select { |l| l.persisted? } }

end
