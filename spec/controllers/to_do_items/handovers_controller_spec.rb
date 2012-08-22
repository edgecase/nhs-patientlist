require 'spec_helper'

describe ToDoItems::HandoversController do
  class ToDoItems::HandoversController < ApplicationController
    skip_before_filter :authenticate_user!
  end

  let(:patient)    { Patient.make! } 
  let(:grade)      { Grade.make! }
  let(:to_do_item) { ToDoItem.make! :patient => patient }
  
  describe "GET new" do
    before do
      get :new, :to_do_item_id => to_do_item.to_param
    end
    
    it "renders the new handover page" do
      response.should render_template("new")
    end
  end

  describe "POST create" do
    let(:valid_attributes) do
      {
        :to_do_item_id => to_do_item.to_param,
        :shift_date => "2012-08-15",
        :handover => {:grade_id => grade.to_param}
      }
    end
    
    context "when there is no handover list for the date specified" do
      it "creates a new handover" do
        expect {
          post :create, valid_attributes
        }.to change(Handover, :count).by(1)
      end

      it "creates a new handover list" do
        expect {
          post :create, valid_attributes
        }.to change(HandoverList, :count).by(1)
      end

      it "assigns the handover list to the handover" do
        post :create, valid_attributes
        Handover.last.handover_list.should == HandoverList.last
      end

      it "assigns a grade to the handover" do
        post :create, valid_attributes
        Handover.last.grade.should == grade
      end

      it "redirects to the patient edit form" do
        post :create, valid_attributes
        response.should redirect_to(edit_patient_path(patient))
      end

      it "displays a status notice" do
        post :create, valid_attributes
        flash[:notice].should == "Task handed over"
      end
    end
  end
end
