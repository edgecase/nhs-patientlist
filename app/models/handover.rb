class Handover < ActiveRecord::Base
  belongs_to :to_do_item
  belongs_to :handover_list
  belongs_to :grade
end
