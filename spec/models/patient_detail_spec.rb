require 'spec_helper' 
describe PatientDetail do
  let(:patient){Patient.make(:hospno=>"4567", :firstnames=>"Rita", :lastname=>"O'Really", :allergies=>"toes", :pastmedhx=>"Grouts")}
  let(:admission){Admission.make(:currward=>'RENAL', :patient=>patient)}
  let(:patient_detail){PatientDetail.new(admission)}
  it "proxies the admission and patient models" do
    patient_detail.ward.should == "RENAL"
    patient_detail.name.should == "Rita O'Really"
    patient_detail.pmh.should == "Grouts"
    patient_detail.allergies.should == "toes"
  end

  describe :selecting do
    before do
      10.times do |i|
        status = i < 5 ? "Admitted" : "Discharged"
        ward = i < 3 ? "RENAL" : "ITU"
        Admission.make!(:patient=>Patient.make(:hospno=>i),:admstatus=>status, :currward=>ward)
      end
    end
    it "admitted returns all admitted patients" do
      PatientDetail.admitted.count.should == 5
    end
    it "in_ward returns all admitted patients in a particular ward" do
      PatientDetail.in_ward('RENAL').count.should == 3
      PatientDetail.in_ward('ITU').count.should == 2
    end
  end

end
