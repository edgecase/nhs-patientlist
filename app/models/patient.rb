class Patient < ActiveRecord::Base
  self.table_name = 'pats'
  self.primary_key = 'hospno'

  has_many :admissions, :foreign_key => 'admhospno'
end