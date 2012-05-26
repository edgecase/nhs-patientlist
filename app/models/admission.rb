class Admission < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'adms'
  self.primary_key = 'adm_id'
end
