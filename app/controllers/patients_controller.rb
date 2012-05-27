class PatientsController < ApplicationController

  expose(:patient)
  expose(:ward) { session[:ward] }
end
