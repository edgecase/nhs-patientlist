require 'spec_helper'

describe "Patient list pages" do
  let(:user)       { User.make! }
  let(:other_user) { User.make!(:email => "another-user@example.com") }
  let(:patient)    { Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123) }
  let(:admission)  { Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient, :admpid => 123) }

  before do
    patient.save
    admission.save
    login(user)
  end

  describe "getting a user's patient lists" do
    it "displays 'new list' if I'm view my own lists" do
      visit user_patient_lists_path(current_user)
      page.should have_css('#new-list')
    end

    it "doesn't display 'new list' on  others' patient lists" do
      visit user_patient_lists_path(other_user)
      page.should_not have_css('#new-list')
    end
  end
  
  
  
  describe "a user's patient list" do
    it "can be created" do
      list_name = "test list creation"
      visit user_patient_lists_path(current_user)
      click_link 'new-list'
      fill_in "Name", :with => list_name
      click_button 'Create List'
      page.should have_content list_name
    end
    
    it "can be viewed" do
      list = current_user.patient_lists.create :name => "Outpatient"
      list.patients << patient
      list.save
      visit user_patient_list_path(current_user, list)
      page.should have_content("Outpatient")
      find("table").should have_content("Rita")
    end
    
    it "can have a patient added to it" do
      list = current_user.patient_lists.create :name => "Outpatient"
      list.patients << patient
      list.save
      visit user_patient_list_path(current_user, list)
      page.should have_content("Outpatient")
      find("table").should have_content("Rita")
    end
    it "can have a patient removed from it" do
    end
  end
  
end
