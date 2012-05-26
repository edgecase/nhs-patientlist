class PatientListsController < ApplicationController
  def current
    @patients = Admission.admitted.map do |admission|
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