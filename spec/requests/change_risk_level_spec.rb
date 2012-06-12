require 'spec_helper'

describe "ChangeWard" do
  describe "A patient's risk level is persisted to the database", :js => true do
    let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
    let(:admission){Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient)}

    before do
      patient.save
      admission.save
    end

    it "should have a patient with a risk level" do
      visit current_patient_lists_path
      page.should have_select('risk_level')
    end
    
    it "should persist the risk level when changed" do
      visit current_patient_lists_path
      select('high', from: 'risk_level')
      visit current_patient_lists_path
      page.should have_select('risk_level', :selected => 'high')
    end

  end
end
