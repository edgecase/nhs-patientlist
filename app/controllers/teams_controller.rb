class TeamsController < ApplicationController
  expose(:teams) { Team.all }

  def index
  end
end
