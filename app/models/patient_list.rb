class PatientList < ActiveRecord::Base
  belongs_to :user
  has_many :patient_lists_patients, :class_name => "PatientListsPatients", :dependent => :destroy
  has_many :patients, :through => :patient_lists_patients

  validates :name, :presence => true, :uniqueness => {:scope => :user_id, :message => "must be unique"}
  attr_accessible :name, :user
end
