require 'spec_helper'

describe Patient do
  let(:patient){Patient.make!}
  describe :todos do
    let(:last_item){patient.to_do_items.find_by_description("Do 2")}
    before do
      3.times do |i| 
        patient.to_do_items.create(:description=>"Do #{i}")
      end
      last_item.make_event("pending", current_user)
    end

    it "displays items in state todo" do
      patient.to_dos.map(&:description).sort.should == ["Do 0", "Do 1"]
    end

    it "displays items in state pending" do
      patient.pendings.map(&:description).sort.should == ["Do 2"]
    end
  end
end
