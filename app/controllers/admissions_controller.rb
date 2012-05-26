class AdmissionsController < ApplicationController
  def index
    render :text=>"There are #{Admission.count} admissions"
  end
end
