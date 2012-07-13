require 'spec_helper'

describe "Patient list pages" do
  let(:user)       { User.make! }
  let(:other_user) { User.make!(:email => "another-user@example.com") }
  let(:patient)    { Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123) }
  let(:admission)  { Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient, :admpid => 123) }
  let(:my_list)    { user.patient_lists.create(:name => "Inpatients") }

  before do
    patient.save
    admission.save
    login(user)
  end
  

  it "my lists displays 'new list'" do
    visit user_patient_lists_path current_user
    page.should have_css '#new-list'
  end

  it "other user's lists do not display 'new list'" do
    visit user_patient_lists_path other_user
    page.should_not have_css '#new-list' 
  end

  
  describe "a patient list" do
    it "can be created" do
      list_name = "test patient list"
      visit user_patient_lists_path current_user
      click_link 'new-list'
      fill_in "Name", with: list_name
      click_button 'Create List'
      page.should have_content list_name
    end
    
    it "can be viewed" do
      my_list.patients << patient
      my_list.save
      visit user_patient_list_path current_user, my_list
      page.should have_content("Inpatients")
      find("table").should have_content("Rita")
    end
    
    it "can have a patient added to it" do
      visit user_patient_list_path(current_user, my_list)
      #fill_in "new-patient-id", with: 
    end
    
    it "can have a patient removed from it" do
      
    end

  end
end
