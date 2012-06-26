module PatientsHelper
  def full_name(patient)
    "#{patient.firstnames} #{patient.lastname}"
  end

  def back_link_text
    return "Back to #{ward}" if ward
    "Back to all patients"
  end

  def audit_status(status)
     return status[1] if status.is_a?(Array)
     status
  end
end
