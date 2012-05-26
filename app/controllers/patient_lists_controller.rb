class PatientListsController < ApplicationController
  def select_ward
    @wards = Admission.wards
  end

  def current
    ward = params[:ward]
    admissions = if ward.nil?
      Admission.admitted
    else
      Admission.admitted.where(:currward => ward)
    end
    @patients = admissions.map do |admission|
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