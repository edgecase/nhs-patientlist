require 'spec_helper'

describe ToDoItem do
  let(:patient) { Patient.make!(:firstnames=>'Rita', :lastname=>"O'Really") }
  let(:item)    { ToDoItem.make!(:description=>"5mg of pentaflourowhatsit, stat") }

  it "is linked to one patient" do
    new_item = patient.to_do_items.create!(:description=>"5mg of pentaflourowhatsit, stat")
    patient.to_do_items.first.should == new_item
  end

  it "is created in 'todo' state by default" do
    item.reload.status.should == 'todo'
  end

  it "is audited" do
    item.update_attribute :status, 'pending'
    item.audits.last.audited_changes['status'].should == %w{todo pending}
  end

  describe "#handed_over?" do
    it "is false when the task has not been handed over" do
      item.should_not be_handed_over
    end

    it "is true when the task is on a handover list" do
      h = Handover.make!(:to_do_item_id => item.id)
      item.should be_handed_over
    end
  end
end
