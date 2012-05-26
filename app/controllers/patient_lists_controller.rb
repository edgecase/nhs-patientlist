class PatientListsController < ApplicationController
  def select_ward
    @wards = ActiveRecord::Base.connection.exec_query("select distinct currward from adms").map{|w| w["currward"]}
  end

  def current
    ward = params[:ward]
    @patients = Admission.admitted.select do |admission|
      ward.nil? or admission.currward == ward
    end.map do |admission|
      patient = admission.patient
      {
        :ward      => admission.currward,
        :hospno    => patient.hospno,
        :name      => "#{patient.firstnames} #{patient.lastname}",
        :birthdate => patient.birthdate,
        :sex       => patient.sex,
        :pmh       => patient.pastmedhx,
        :allergies => patient.allergies
        # -- previous medical history (PMH)
      }
    end
  end
end