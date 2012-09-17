class TeamMembersController < ApplicationController
  def create
    p params
    fail
    TeamMember.create!(params)
  end
end
