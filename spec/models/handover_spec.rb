require 'spec_helper'

describe Handover do
  describe "#shift_date=" do
    let(:to_do_item) { ToDoItem.make! }
    let(:grade)      { Grade.make! }
    let(:team)       { Team.make! }
    let(:handover)   { Handover.new :to_do_item_id => to_do_item.id,
        :grade_id      => grade.id,
        :team_id       => team.id
    }
                          
    context "when no handover list exists for the date" do
      it "creates a new handover list" do
        handover.shift_date = "2012-02-01"
        handover.save!
        handover.handover_list.shift_date.should == Date.new(2012, 2, 1)
      end
    end
  end
end
