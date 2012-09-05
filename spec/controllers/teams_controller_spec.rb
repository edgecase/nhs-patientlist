require 'spec_helper'

class TeamsController
  skip_before_filter :authenticate_user!
end

describe TeamsController do
  describe "GET index" do
    it "renders the index page" do
      get :index
      response.should render_template("index")
    end
  end
end
