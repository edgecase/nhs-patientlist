class TeamMembersController < ApplicationController
  expose(:team_membership) do
    TeamMembership.new(
      :user => User.find(params[:user_id]),
      :team => Team.find(params[:team_id])
    )
  end

  def create
    if team_membership.save
      redirect_to teams_path, :notice => "You have joined '#{team_membership.team.name}'"
    else
      flash[:alert] = "Error joining team - #{team_membership.errors.full_messages.join(", ")}"
      redirect_to teams_path
    end 
  end
end
