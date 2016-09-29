class Event < ApplicationRecord
  validates_presence_of :name, :description

  has_many :attendees, :dependent => :destroy
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  belongs_to :category
  has_one :location

  delegate :name , :to => :category , :prefix => true , :allow_nil => true
  delegate :name , :to => :location , :prefix => true , :allow_nil => true``
end
