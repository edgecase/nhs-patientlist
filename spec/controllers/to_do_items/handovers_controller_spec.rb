require 'spec_helper'

describe ToDoItems::HandoversController do
  class ToDoItems::HandoversController < ApplicationController
    skip_before_filter :authenticate_user!
  end
  
  let(:to_do_item) { ToDoItem.make! }
  
  describe "GET new" do
    it "renders the new handover page" do
      get :new, :to_do_item_id => to_do_item.to_param
      response.should render_template("new")
    end
  end
end
