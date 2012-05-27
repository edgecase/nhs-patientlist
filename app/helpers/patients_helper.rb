module PatientsHelper
  def full_name(patient)
    "#{patient.firstnames} #{patient.lastname}"
  end

  def back_link_text
    return "Back to #{ward}" if ward
    "Back to all patients"
  end
end
