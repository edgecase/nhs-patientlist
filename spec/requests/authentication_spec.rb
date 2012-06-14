require 'spec_helper'

describe "Authentication", :js => true do
  let(:user) {User.make!}

  it "logged out users should be redirected to the sign in form" do
    visit current_patient_lists_path
    page.should have_content("Sign in")
  end

  it "logged in users should see the sign in form when they log out" do
    login(user)
    visit current_patient_lists_path
    click_link "Sign out"
    page.should have_content("Sign in")
  end
end
