class Patient < ActiveRecord::Base
  self.table_name = 'pats'
  self.primary_key = 'pat_id'

  has_many :admissions, :primary_key => "hospno", :foreign_key => 'admhospno'
  has_many :to_do_items

  def to_dos
    to_do_items.select{|item| "todo" == item.state}
  end

  def pendings
    to_do_items.select{|item| "pending" == item.state}
  end

end
