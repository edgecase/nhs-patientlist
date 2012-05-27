require 'spec_helper'

describe ToDoItem do
  describe "events" do
    let(:item) {ToDoItem.make!(:description=>"5mg of pentaflourowhatsit, stat")}

    it "is created in 'todo' state" do
      item.reload.state.should == 'todo'
    end

    it "changes state when a new event occurs" do
      item.make_event 'pending'
      item.reload.state.should == 'pending'
    end
  end
end
