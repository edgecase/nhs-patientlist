class PatientsController < ApplicationController

  expose(:patient)
  expose(:ward) { session[:ward] }

  def history

  end

  def update_risk_level
    @patient = Patient.find(params[:id])
    result = (@patient.risk_level = params[:risk_level])
    respond_to do |format|
      if result
        format.json { render status: 200 }
        format.html { redirect_to :back, :notice => "Risk level updated"}
      else
        format.json { render status: :unproccessable_entity }
        format.html { redirect_to :back, :notice => result.errors.full_messages }
      end
    end
  end
end
