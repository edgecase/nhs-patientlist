require 'spec_helper'

class TeamMembershipsController
  skip_before_filter :authenticate_user!
end

describe TeamMembershipsController do
  describe "POST create" do
    let!(:user) { User.make! }
    let!(:team) { Team.make! }
    let(:valid_attributes) do
      {:user_id => user.to_param, :team_id => team.to_param}
    end
    
    it "creates a new team membership" do
      expect {
        post :create, valid_attributes
      }.to change(TeamMembership, :count).by(1)
    end

    it "redirects to the team index page" do
      post :create, valid_attributes
      response.should redirect_to(teams_path)
    end

    it "displays a flash message" do
      post :create, valid_attributes
      flash[:notice].should == "You have joined '#{team.name}'"
    end
  end
end
