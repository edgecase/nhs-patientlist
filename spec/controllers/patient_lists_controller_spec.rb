require 'spec_helper'

describe PatientListsController do
  login_user
  let(:patient) { Patient.make! }
  let(:list) { PatientList.make!(:user => current_user, :name => 'Inpatients') }
  describe '#index' do
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
  describe '#destroy' do
      let(:other_user) { User.make!(:email => 'test2@example.net')}
      let(:other_list) { other_user.patient_lists.create(:name => "Outpatients")}
    it "destroys the list if you own it" do
      controller.send(:own_patient_list).should_receive(:destroy)
      delete :destroy, user_id: current_user.id, id: list.id
      response.should redirect_to :controller => :patient_lists,
        :user_id => current_user.id, 
        :action => :index, :notice =>  "Successfully removed list"
    end
    it "doesn't destroy the list if you don't own it" do
      delete :destroy, user_id: other_user.id, id: other_list.id
      other_list.reload.name.should == "Outpatients"
    end
  end
end
