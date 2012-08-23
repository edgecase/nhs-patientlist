require 'spec_helper'

describe Shift do
  let!(:day_shift)     { Shift.create! :name => "Day" }
  let!(:on_call_shift) { Shift.create! :name => "On Call" }
 

  describe ".day" do
    it "returns the day shift" do
      Shift.day.should == day_shift
    end
  end

  describe ".on-all" do
    it "returns the on call shift" do
      Shift.on_call.should == on_call_shift
    end
  end 
end
