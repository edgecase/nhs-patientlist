require 'spec_helper'

describe "Patient lists" do
  let(:user)       { User.make!(email: "test@example.com") }
  let(:other_user) { User.make! }
  let(:patient)    { Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123) }
  let(:admission)  { Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient, :admpid => 123) }
  let(:my_list)    { user.patient_lists.create(:name => "Inpatients") }

  before do
    10.times do
      User.make!
    end
    patient.save
    admission.save
    my_list.save
    login(user)
  end

  it "is visible in the sidebar" do
    visit root_path
    find('#sidebar').should have_content my_list.name
  end

  it "displays 'new list'" do
    visit user_patient_lists_path current_user
    page.should have_css '#new-list'
  end

  it "does not display 'new list' on other users' lists" do
    visit user_patient_lists_path other_user
    page.should_not have_css '#new-list'
  end


  describe "a patient list" do
    before :each do
      my_list.patients << patient
      my_list.save
    end

    it "can be created from the sidebar", js: true do
      list_name = "test patient list"
      visit root_path
      within('#sidebar') do
        fill_in "new-list-name", with: list_name
        click_button 'create-list'
      end
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

    it "can have a patient added to it", js: true do
      patient2 = Patient.make!(firstnames: "Joe", lastname:"O'Really", id: 1234)
      adm2     = Admission.make!(currward: "Renal", admstatus:  "Admitted", patient: patient2, admpid: patient2.id)
      visit root_path
      page.find(:xpath, '//table//tr[@data-patient-id="1234"]').drag_to(page.find(:xpath, '//*[@id="patient-list-index"]/li/a'))
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
