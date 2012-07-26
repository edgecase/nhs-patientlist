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
    my_list.save
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
    before :each do
      my_list.patients << patient
      my_list.save
    end

    it "can be created" do
      list_name = "test patient list"
      visit user_patient_lists_path current_user
      click_link 'new-list'
      fill_in "Name", with: list_name
      click_button 'Create List'
      page.should have_content list_name
    end

    it "can be deleted", js: true do
      visit user_patient_lists_path current_user
      page.should have_content my_list.name
      visit user_patient_list_path current_user, my_list
      click_link 'delete-list'
      page.should_not have_content my_list.name
    end

    it "doesn't have a delete link if it's another user's list" do
      other_list = other_user.patient_lists.create(:name => "Outpatients") 
      visit user_patient_list_path other_user, other_list
      page.should_not have_content "Delete"
    end
    
    it "can be viewed" do
      visit user_patient_list_path current_user, my_list
      page.should have_content("Inpatients")
      find("table").should have_content "Rita"
    end
    
    it "can have a patient added to it" do
      patient2 = Patient.make!(firstnames: "Joe", lastname:"O'Really", id: 1234)
      adm2     = Admission.make!(currward: "Renal", admstatus:  "Admitted", patient: patient2, admpid: patient2.id)
      visit patient_path(patient2)
      within("#patient-lists") do
        select "Inpatients", from: 'membership_patient_list'
        click_button "add-to-list"
      end
      find("#patient-lists").should have_content "Inpatients"
      visit user_patient_list_path current_user, my_list
      find("table").should have_content "Joe"
    end
    
    it "can have a patient removed from it" do
      visit user_patient_list_path current_user, my_list
      within(:xpath, '//table//tr[@data-patient-id="123"]') do
        find('.remove').click 
      end
    end

  end
end
