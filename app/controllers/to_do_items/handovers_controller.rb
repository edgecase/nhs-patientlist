class ToDoItems::HandoversController < ApplicationController
  expose(:to_do_item) { ToDoItem.find(params[:to_do_item_id]) }
end
