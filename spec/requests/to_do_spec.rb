require 'spec_helper'

describe "To do", :js => true do
  let(:user) {User.make!}
  let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
  let(:admission){Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient)}

  before do
    patient.save
    admission.save
    login(user)
    visit edit_patient_path(patient.id)
  end

  it "is created in 'todo' state by default" do
    fill_in 'Description', :with => 'Check pulse'
    click_button "Add"
    find("#todo").should have_content('Check pulse')
  end
  it "can be created as 'pending'" do
    fill_in 'Description', :with => 'Check bp'
    select("Pending", from: "to_do_item_to_do_state")
    click_button "Add"
    find("#pending").should have_content('Check bp')
  end
end
