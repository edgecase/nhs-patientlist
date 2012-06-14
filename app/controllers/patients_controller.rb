class PatientsController < ApplicationController

  expose(:patient)
  expose(:ward) { session[:ward] }

  def history

  end

  def update_risk_level
    @patient = Patient.find(params[:id])
    @result = (@patient.risk_level = params[:risk_level])
    respond_to do |format|
      if @result
        format.html { redirect_to :back, :notice => 'Risk level updated' }
      else
        format.html { redirect_to :back, :notice => "The risk level wasn't saved. Please try again." }
      end
      format.js
    end
  end
end
