class TeamMembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  validates_presence_of :user_id, :team_id

  attr_accessible :user, :team  
end
