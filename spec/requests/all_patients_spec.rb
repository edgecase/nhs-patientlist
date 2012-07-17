require 'spec_helper'

describe "Patients list" do
  let(:user) {User.make!}
  let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
  let(:admission){Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient)}

  before do
    patient.save
    admission.save
    login(user)
  end

  describe "Patients list reacts to 'ward' change", :js => true do
    before { visit current_patients_path }

    it "changes the ward when a new one is selected" do
      select('RENAL', from: 'ward')
      page.should have_content("RENAL Patients")
    end
    it "does not change wards when nothing is selected" do
      select('RENAL', from: 'ward')
      page.should have_content("RENAL Patients")
      select('', from: 'ward')
      page.should have_content("RENAL Patients")
    end
    it "shows all patients when 'all patients' is clicked" do
      click_link "show all patients"
      page.should have_content("All Patients")
    end
  end

  describe "A patient's risk level is persisted to the database", :js => true do

    it "should have a patient with a risk level" do
      visit current_patients_path
      page.should have_select('risk_level')
    end

    it "should persist the risk level when changed" do
      visit current_patients_path
      select('high', from: 'risk_level')
      visit current_patients_path
      page.should have_select('risk_level', :selected => 'high')
    end
  end

end
