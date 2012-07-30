require 'spec_helper'

describe ApplicationController do
  login_user
  it "exposes the user's patient lists" do
    controller.send(:own_patient_lists).should eq(PatientList.find_all_by_user_id(current_user.id))
  end
end
