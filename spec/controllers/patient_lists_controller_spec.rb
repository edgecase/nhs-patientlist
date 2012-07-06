require 'spec_helper'

describe PatientListsController do
  login_user
  describe '#index' do
    let(:patient) { Patient.make! }
    let(:list) { PatientList.make!(:user => current_user, :name => 'Inpatients') }
    it "gets the current user's custom patient lists" do
      get :index, { :user_id => current_user.id }
      controller.send(:own_patient_lists).should eq(PatientList.find_all_by_user_id(current_user.id))
    end
  end
  describe '#create' do
    let(:outpatients) { "Outpatients" }
    it "creates a new custom patient list and redirects to the index" do
      post :create, :own_patient_list => { "name" => outpatients}, :user_id => current_user.id
      current_user.patient_lists.find_by_name(outpatients).should_not be_nil
      response.should redirect_to(:controller => :patient_lists, :action => :index, :notice=> 'Successfully created new list')
    end
    it "handles not creating an invalid patient list" do
      post :create, :own_patient_list => {}
      response.should render_template(:new)
    end
  end
  describe '#new' do
    it "has a new page with a patient_list" do
      get :new
      assigns(:own_patient_list)
    end
  end
end
