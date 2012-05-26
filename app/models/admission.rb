class Admission < ActiveRecord::Base
  self.table_name = 'adms'
  self.primary_key = 'adm_id'

  scope :admitted, where("admstatus = 'Admitted' and admhospno is not NULL")

  belongs_to :patient, :primary_key => 'hospno', :foreign_key => 'admhospno'

  def self.wards
    ActiveRecord::Base.connection.exec_query("select distinct currward from adms").map do |admission|
      admission["currward"]
    end.compact
  end
end
