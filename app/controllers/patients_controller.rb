class PatientsController < ApplicationController

  expose(:patient)
  expose(:ward) { session[:ward] }

  def history

  end
end
