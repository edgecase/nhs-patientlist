module PatientsHelper
  def full_name(patient)
    "#{patient.firstnames} #{patient.lastname}"
  end

  def back_link_text
    ward ? "Back to #{ward}" : "Back to all patients"
  end

  def audit_status(status)
     status.is_a?(Array) ? status[1] : status
  end
end
