require 'spec_helper'

describe "Patients list" do
  let(:user) { User.make! }
  let(:other_user) {User.make!(:email => "another-user@example.com")}
  let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
  let(:admission){Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient)}

  before do
    patient.save
    admission.save
    login(user)
  end

  describe "Patient Lists" do

    it "displays 'new list' if I'm on 'my lists'" do
      visit user_custom_patient_lists_path(current_user)
      page.should have_css('.new-list')
    end
    it "doesn't display 'new list' if I'm on another users' lists" do
      visit user_custom_patient_lists_path(other_user)
      page.should_not have_css('.new-list')
    end

  end

end
