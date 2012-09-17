class TeamMembershipsController < ApplicationController
  expose(:team_membership) do
    TeamMembership.new(
      :user => User.find(params[:user_id]),
      :team => Team.find(params[:team_id])
    )
  end
  
  def create
    team_membership.save!
    redirect_to teams_path, :notice => "You have joined '#{team_membership.team.name}'"
  end
end
