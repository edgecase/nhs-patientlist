class Consultant < ActiveRecord::Base
  self.primary_key = 'consult_id'

  has_many :admissions, :primary_key => "consultcode", :foreign_key => "admconsultcode"
end