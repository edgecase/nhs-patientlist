require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PatientsHelper. For example:
#
# describe PatientsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PatientsHelper do
  let(:patient){Patient.make(:firstnames=>"Rita", :lastname=>"O'Really")}
  describe :full_name do
    it "concats first and last names" do
      helper.full_name(patient).should == "Rita O'Really"
    end
  end
end
