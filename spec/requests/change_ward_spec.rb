require 'spec_helper'

describe "ChangeWard" do
  describe "Patients list reacts to 'ward' change", :js => true do
    let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
    let(:admission){Admission.make!(:currward=>'RENAL', :patient=>patient)}

    before do
      patient.save
      admission.save
      visit current_patient_lists_path
    end

    it "changes the ward when a new one is selected" do
      select('RENAL', from: 'ward')
      page.should have_content("RENAL Patients")
    end
    it "does not change wards when '--' is selected" do
      select('RENAL', from: 'ward')
      page.should have_content("RENAL Patients")
      select('--', from: 'ward')
      page.should have_content("RENAL Patients")
    end
    it "shows all patients when 'all patients' is clicked" do
      click_link "show all patients"
      page.should have_content("All Patients")
    end

  end
end
