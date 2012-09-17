require 'spec_helper'

describe Team do
  it { should belong_to(:shift) }
  it { should have_many(:team_memberships) }

  it { should validate_presence_of(:shift_id) }
  it { should validate_presence_of(:name) }
end
