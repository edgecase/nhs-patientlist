require 'spec_helper'

describe "Todos", :js => true do
  let(:user) {User.make!}
  let(:patient){Patient.make!(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts", :id=>123)}
  let(:admission){Admission.make!(:currward=>'RENAL', :admstatus => "Admitted", :patient=>patient)}

  before do
    patient.save
    admission.save
    login(user)
  end

  describe "a new Todo" do
    before { visit edit_patient_path(patient.id) }

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
  describe "existing Todos" do
    before do
      todo = patient.to_do_items.create(:description=>'starts as todo')
      visit edit_patient_path(patient.id)
    end

    it "can be marked as pending" do
      within("#todo li") do
        page.should have_content('starts as todo')
        click_button "Pending"
      end
      find("#pending").should have_content('starts as todo')
    end
    it "can be marked as done" do
      save_and_open_page
      within("#todo li") do
        page.should have_content('starts as todo')
        click_button "Done"
      end
      page.should have_no_content('starts as todo')
    end

  end
end
