class CustomPatientList < ActiveRecord::Base
  belongs_to :user
  has_many :members, :dependent => :destroy
  has_many :patients, :through => :members

  validates :name, :presence => true, :uniqueness => {:scope => :user_id, :message => "must be unique"}
  attr_accessible :name, :user
end
