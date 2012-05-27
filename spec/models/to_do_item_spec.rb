require 'spec_helper'

describe ToDoItem do
  let(:patient) {Patient.make!(:firstnames=>'Rita', :lastname=>"O'Really")}
  let(:item) {ToDoItem.make!(:description=>"5mg of pentaflourowhatsit, stat")}

  it "is linked to one patient" do
    new_item = patient.to_do_items.create!(:description=>"5mg of pentaflourowhatsit, stat")
    patient.to_do_items.first.should == new_item
  end

  describe "events" do
    it "is created in 'todo' state" do
      item.reload.state.should == 'todo'
    end

    it "changes state when a new event occurs" do
      item.make_event 'pending'
      item.reload.state.should == 'pending'
    end
  end
end
