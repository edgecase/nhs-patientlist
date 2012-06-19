require 'spec_helper'

describe ToDoItem do
  let(:patient) {Patient.make!(:firstnames=>'Rita', :lastname=>"O'Really")}
  let(:item) {ToDoItem.make!(:description=>"5mg of pentaflourowhatsit, stat")}

  it "is linked to one patient" do
    new_item = patient.to_do_items.create!(:description=>"5mg of pentaflourowhatsit, stat")
    patient.to_do_items.first.should == new_item
  end
  it "is linked to the user that created it" do
    new_item = patient.to_do_items.create!(:description=>"administer antibiotics", :owner=> current_user)
    new_item.to_do_item_events.first.user.should == current_user
  end

  describe "events" do
    it "is created in 'todo' state by default" do
      item.reload.state.should == 'todo'
    end
    it "can be created in the 'pending' state" do
      pending_item = patient.to_do_items.create(:description=>'Check blood pressure', :to_do_state => 'pending')
      pending_item.reload.state.should == 'pending'
    end

    it "change state when a new event occurs" do
      item.make_event('pending', current_user)
      item.reload.state.should == 'pending'
    end
  end
end
